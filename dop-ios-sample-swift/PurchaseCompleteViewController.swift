//
//  PurchaseCompleteViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/28.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class PurchaseCompleteViewController: UIViewController {

    @IBOutlet var lblPurchaseInfo: UILabel!
    
    var checkOutInfo:CheckOut!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /** XSIGHTin
         * Set "Check_Out" event with properties
         */
        DOX.setEventGroupName("Check_Out")
        DOX.logEvent(XEvent.builder({ (event) in
            if let evt = event as? XEvent {
                evt.setEventName("Check_Out")
                evt.setProperties(XProperties.builder({ (property) in
                    if let prop = property as? XProperties {
                        prop.set("xi_is_host", value: "Guest")  // This sample works as only Guest
                        prop.set("ordNo", value: self.checkOutInfo.orderNumber)
                        prop.set("curcy", value: self.checkOutInfo.curcy)
                        prop.set("totalAmount", value: self.checkOutInfo.requestToBook.calcTotalFee())
                        prop.set("xi_timezone", value: self.checkOutInfo.timezone)
                        prop.set("xi_room_id", value: self.checkOutInfo.requestToBook.product.roomId)
                        prop.set("xi_name", value: self.checkOutInfo.requestToBook.product.name)
                        prop.set("xi_search_id", value: self.checkOutInfo.requestToBook.product.searchId)
                        prop.set("xi_city_id", value: self.checkOutInfo.requestToBook.product.cityInfo.cityId)
                        prop.set("xi_city_nm", value: self.checkOutInfo.requestToBook.product.cityInfo.cityName)
                        prop.set("xi_type_of_accommodation", value: self.checkOutInfo.requestToBook.product.typeOfAccommodation)
                        prop.set("xi_room_type", value: self.checkOutInfo.requestToBook.product.roomType)
                        prop.set("xi_bedrooms", value: self.checkOutInfo.requestToBook.product.numOfBedRooms)
                        prop.set("xi_bathrooms", value: self.checkOutInfo.requestToBook.product.numOfBethrooms)
                        prop.set("xi_families", value: self.checkOutInfo.requestToBook.product.families)
                        prop.set("xi_kitchen_facillities", value: self.checkOutInfo.requestToBook.product.kitchenFacillities)
                        prop.set("xi_entertainment", value: self.checkOutInfo.requestToBook.product.entertainment)
                        prop.set("xi_room_facillities", value: self.checkOutInfo.requestToBook.product.roomFacillities)
                        prop.set("xi_facilities", value: self.checkOutInfo.requestToBook.product.facilities)
                        prop.set("xi_special_facilities", value: self.checkOutInfo.requestToBook.product.specialFacilities)
                        prop.set("xi_booking_type", value: self.checkOutInfo.requestToBook.product.bookingType)
                        prop.set("xi_cancel_policy", value: self.checkOutInfo.requestToBook.product.cancelPolicy)
                        prop.set("xi_discount_id", value: self.checkOutInfo.requestToBook.product.discountId)
                        prop.set("xi_discount_nm", value: self.checkOutInfo.requestToBook.product.discountName)
                        prop.set("xi_discount_percent", value: self.checkOutInfo.requestToBook.product.discountPercent)
                        prop.set("xi_roomrate_weekdays", value: self.checkOutInfo.requestToBook.product.roomrate_weekdays)
                        prop.set("xi_roomrate_weekend", value: self.checkOutInfo.requestToBook.product.roomrate_weekend)
                        prop.set("xi_number_of_review", value: self.checkOutInfo.requestToBook.product.numbOfReview)
                        prop.set("xi_review_rate", value: self.checkOutInfo.requestToBook.product.reviewRate)
                        prop.set("xi_date_booking", value: self.checkOutInfo.requestToBook.dateBooking.timeIntervalSince1970)
                        prop.set("xi_date_checkin", value: self.checkOutInfo.requestToBook.dateCheckin.timeIntervalSince1970)
                        prop.set("xi_date_checkout", value: self.checkOutInfo.requestToBook.dateCheckout.timeIntervalSince1970)
                        prop.set("xi_number_of_guest", value: self.checkOutInfo.requestToBook.numbOfGuest)
                        prop.set("xi_rental_fee", value: self.checkOutInfo.requestToBook.calcRentFee())
                        prop.set("xi_cleaning_fee", value: self.checkOutInfo.requestToBook.product.cleaningFee)
                        prop.set("xi_other_service_fee", value: self.checkOutInfo.requestToBook.product.otherServiceFee)
                        prop.set("xi_discount_apply", value: self.checkOutInfo.requestToBook.discountApply)
                        prop.set("xi_booking_id", value: self.checkOutInfo.requestToBook.bookingId)
                        prop.set("xi_payment_type", value: self.checkOutInfo.paymentType)
                        prop.set("xi_payment_date", value: self.checkOutInfo.paymentDate.timeIntervalSince1970)
                        prop.set("xi_thankyoupage", value: self.checkOutInfo.didClickThankyouPage)
                    }
                }))
            }
        }))
        /** END of code for XSIGHTin
         */
    }

    @IBAction func btnBackToMain(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

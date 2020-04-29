//
//  RequestToBookViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/27.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class RequestToBookViewController: UIViewController {
    
    @IBOutlet var lblRequestInfo: UILabel!
    
    var selectedReqToBook:RequestToBook!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblRequestInfo.numberOfLines = 0    // unlimited number of lines
        displayReqToBookInfo()
        
        /** XSIGHTin
         * Set "Click_Request_to_Book" event with properties
         */
        DOX.setEventGroupName("Click_Request_to_Book")
        DOX.logEvent(XEvent.builder({ (event) in
            if let evt = event as? XEvent {
                evt.setEventName("Click_Request_to_Book")
                evt.setProperties(XProperties.builder({ (property) in
                    if let prop = property as? XProperties {
                        prop.set("xi_is_host", value: "Guest")  // This sample works as only Guest
                        prop.set("xi_room_id", value: self.selectedReqToBook.product.roomId)
                        prop.set("xi_host_id", value: self.selectedReqToBook.product.hostId)
                        prop.set("xi_name", value: self.selectedReqToBook.product.name)
                        prop.set("xi_search_id", value: self.selectedReqToBook.product.searchId)
                        prop.set("xi_city_id", value: self.selectedReqToBook.product.cityInfo.cityId)
                        prop.set("xi_city_nm", value: self.selectedReqToBook.product.cityInfo.cityName)
                        prop.set("xi_type_of_accommodation", value: self.selectedReqToBook.product.typeOfAccommodation)
                        prop.set("xi_room_type", value: self.selectedReqToBook.product.roomType)
                        prop.set("xi_bedrooms", value: self.selectedReqToBook.product.numOfBedRooms)
                        prop.set("xi_bathrooms", value: self.selectedReqToBook.product.numOfBethrooms)
                        prop.set("xi_families", value: self.selectedReqToBook.product.families)
                        prop.set("xi_kitchen_facillities", value: self.selectedReqToBook.product.kitchenFacillities)
                        prop.set("xi_entertainment", value: self.selectedReqToBook.product.entertainment)
                        prop.set("xi_room_facillities", value: self.selectedReqToBook.product.roomFacillities)
                        prop.set("xi_facilities", value: self.selectedReqToBook.product.facilities)
                        prop.set("xi_special_facilities", value: self.selectedReqToBook.product.specialFacilities)
                        prop.set("xi_booking_type", value: self.selectedReqToBook.product.bookingType)
                        prop.set("xi_cancel_policy", value: self.selectedReqToBook.product.cancelPolicy)
//                        prop.set("xi_satus", value: self.selectedReqToBook.)
                        prop.set("xi_discount_id", value: self.selectedReqToBook.product.discountId)
                        prop.set("xi_discount_nm", value: self.selectedReqToBook.product.discountName)
                        prop.set("xi_discount_percent", value: self.selectedReqToBook.product.discountPercent)
                        prop.set("xi_roomrate_weekdays", value: self.selectedReqToBook.product.roomrate_weekdays)
                        prop.set("xi_roomrate_weekend", value: self.selectedReqToBook.product.roomrate_weekend)
                        prop.set("xi_number_of_review", value: self.selectedReqToBook.product.numbOfReview)
                        prop.set("xi_review_rate", value: self.selectedReqToBook.product.reviewRate)
                        prop.set("xi_booking_id", value: self.selectedReqToBook.bookingId)
                        prop.set("xi_date_booking", value: self.selectedReqToBook.dateBooking.timeIntervalSince1970)
                        prop.set("xi_date_checkin", value: self.selectedReqToBook.dateCheckin.timeIntervalSince1970)
                        prop.set("xi_date_checkout", value: self.selectedReqToBook.dateCheckout.timeIntervalSince1970)
                        prop.set("xi_number_of_guest", value: self.selectedReqToBook.numbOfGuest)
                        prop.set("xi_rental_fee", value: self.selectedReqToBook.calcRentFee())
                        prop.set("xi_cleaning_fee", value: self.selectedReqToBook.product.cleaningFee)
                        prop.set("xi_other_service_fee", value: self.selectedReqToBook.product.otherServiceFee)
                        prop.set("xi_discount_apply", value: self.selectedReqToBook.discountApply)
                        prop.set("xi_total_fee", value: self.selectedReqToBook.calcTotalFee())
                        prop.set("xi_request_to_book", value: self.selectedReqToBook.actionRequestToBook)
                    }
                }))
            }
        }))
    }

    func displayReqToBookInfo() {
        let txtRequestInfo = """
        Click_Request_to_Book
        ---------------------
        xi_booking_id: \(selectedReqToBook.bookingId)
        xi_date_booking: \(selectedReqToBook.dateBooking)
        xi_date_checkin: \(selectedReqToBook.dateCheckin)
        xi_date_checkout: \(selectedReqToBook.dateCheckout)
        xi_number_of_guest: \(selectedReqToBook.numbOfGuest)
        xi_rental_fee: \(selectedReqToBook.calcRentFee())
        xi_cleaning_fee: \(selectedReqToBook.product.cleaningFee)
        xi_other_service_fee: \(selectedReqToBook.product.otherServiceFee)
        xi_discount_apply: \(selectedReqToBook.discountApply)
        xi_total_fee: \(selectedReqToBook.calcTotalFee())
        xi_request_to_book: \(selectedReqToBook.actionRequestToBook)
        ---------------------
        xi_room_id: \(selectedReqToBook.product.roomId)
        xi_host_id: \(selectedReqToBook.product.hostId)
        xi_name: \(selectedReqToBook.product.name)
        xi_search_id: \(selectedReqToBook.product.searchId)
        xi_city_id: \(selectedReqToBook.product.cityInfo.cityId)
        xi_city_nm: \(selectedReqToBook.product.cityInfo.cityName)
        xi_type_of_accommodation: \(selectedReqToBook.product.typeOfAccommodation)
        xi_room_type: \(selectedReqToBook.product.roomType)
        xi_bedrooms: \(selectedReqToBook.product.numOfBedRooms)
        xi_bathrooms: \(selectedReqToBook.product.numOfBethrooms)
        xi_families: \(selectedReqToBook.product.families)
        xi_kitchen_facillities: \(selectedReqToBook.product.kitchenFacillities)
        xi_entertainment: \(selectedReqToBook.product.entertainment)
        xi_room_facillities: \(selectedReqToBook.product.roomFacillities)
        xi_facilities: \(selectedReqToBook.product.facilities)
        xi_special_facilities: \(selectedReqToBook.product.specialFacilities)
        xi_booking_type: \(selectedReqToBook.product.bookingType)
        xi_cancel_policy: \(selectedReqToBook.product.cancelPolicy)
        xi_discount_id: \(selectedReqToBook.product.discountId)
        xi_discount_nm: \(selectedReqToBook.product.discountName)
        xi_discount_percent: \(selectedReqToBook.product.discountPercent)
        xi_roomrate_weekdays: \(selectedReqToBook.product.roomrate_weekdays)
        xi_roomrate_weekend: \(selectedReqToBook.product.roomrate_weekend)
        xi_number_of_review: \(selectedReqToBook.product.numbOfReview)
        xi_review_rate: \(selectedReqToBook.product.reviewRate)
        """
        lblRequestInfo.text = txtRequestInfo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

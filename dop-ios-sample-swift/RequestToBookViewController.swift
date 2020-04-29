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

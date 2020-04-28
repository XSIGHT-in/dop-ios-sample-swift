//
//  RequestToBook.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/28.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import Foundation

class RequestToBook {
    var product:Product
    
    var bookingId:String    // xi_booking_id: Ramdom Generated
    var dateBooking:Date    // xi_date_booking
    var dateCheckin:Date    // xi_date_checkin
    var dateCheckout:Date   // xi_date_checkout
    var numbOfGuest:Int         // xi_number_of_guest
    
    var discountApply:String    // xi_discount_apply: True of False
    var actionRequestToBook:String // xi_request_to_book: Click / NA
    
    init() {
        self.product = Product.init(city: City.init(), product: Product.Name.first)
        self.bookingId = "SAMPLEIDX"
        self.dateBooking = Date.init()
        self.dateCheckin = Date.init()
        self.dateCheckout = Date.init()
        self.numbOfGuest = 1
        self.discountApply = String(false)
        self.actionRequestToBook = "Click"
    }
    
    convenience init(product:Product) {
        self.init()
        self.product = product
    }
    
    // for xi_total_fee
    func calculateTotalFee() -> Float {
        var roomNights = 1
        return product.unitFee * Float(roomNights) + product.cleaningFee + product.otherServiceFee
    }
}

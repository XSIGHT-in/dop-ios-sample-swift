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
    
    // for in-app tracking events
    var bookingId:String    // xi_booking_id: Ramdom Generated
    var dateBooking:Date    // xi_date_booking
    var dateCheckin:Date    // xi_date_checkin
    var dateCheckout:Date   // xi_date_checkout
    var numbOfGuest:Int         // xi_number_of_guest
    var discountApply:String    // xi_discount_apply: True of False
    var actionRequestToBook:String // xi_request_to_book: Click / NA
        
    convenience init() {
        let defaultProduct = Product.init(city: City.init(), product: Product.Name.first)
        let dateBooking = Date.init()
        let dateCheckin = Date.init()
        let dateCheckout = Date.init()
        
        self.init(product: defaultProduct, numOfGuest: 1, dateBooking: dateBooking, dateCheckin: dateCheckin, dateCheckout: dateCheckout)
    }
    
    init(product:Product, numOfGuest:Int, dateBooking:Date, dateCheckin:Date, dateCheckout:Date) {
        self.product = product
        self.dateBooking = dateBooking
        self.dateCheckin = dateCheckin
        self.dateCheckout = dateCheckout
        self.numbOfGuest = numOfGuest
        
        self.bookingId = "SAMPLEIDX"
        self.discountApply = String(false)
        self.actionRequestToBook = "Click"
    }
    
    func calcRoomNights() -> Int {
        return Calendar.current.dateComponents([.day], from: dateCheckin, to: dateCheckout).day!
    }
    
    // for xi_total_fee
    func calculateTotalFee() -> Float {
        let roomNights = calcRoomNights()
        
        return product.unitFee * Float(roomNights) + product.cleaningFee + product.otherServiceFee
    }
}

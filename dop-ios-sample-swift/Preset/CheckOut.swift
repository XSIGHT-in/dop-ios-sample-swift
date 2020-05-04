//
//  CheckOut.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/29.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import Foundation

class CheckOut {
    var requestToBook:RequestToBook
    
    var orderNumber:String  // ordNo: same as xi_booking_id
    var curcy:String    // curcy: USD, VND, KRW, etc.
    var timezone:String     // xi_timezone: Country phone code. ex) 84
    var paymentType:String  // xi_payment_type: International card
    var paymentDate:Date    // xi_payment_date
    var didClickThankyouPage:String // xi_thankyoupage: Click / NA
    
    convenience init() {
        self.init(requestToBook: RequestToBook.init(),
                  paymentDate: Date.init(),
                  paymentType: "International card",
                  didClickThankyouPage: false)
    }
    
    init(requestToBook:RequestToBook, paymentDate:Date, paymentType:String, didClickThankyouPage:Bool) {
        self.requestToBook = requestToBook
        self.orderNumber = requestToBook.bookingId
        self.curcy = "USD"
        self.timezone = "84"    // Vietnam
        self.paymentDate = paymentDate
        self.paymentType = paymentType
        self.didClickThankyouPage = didClickThankyouPage ? "Click" : "NA"
    }
}

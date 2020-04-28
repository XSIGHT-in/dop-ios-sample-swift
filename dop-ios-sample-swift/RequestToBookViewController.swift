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
        """
        
        lblRequestInfo.text = txtRequestInfo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

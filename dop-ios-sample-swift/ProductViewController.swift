//
//  ProductViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/27.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet var imgProductView: UIImageView!
    @IBOutlet var pickerCheckIn: UIDatePicker!
    @IBOutlet var pickerCheckOut: UIDatePicker!
    @IBOutlet var txtCheckIn: UILabel!
    @IBOutlet var txtCheckOut: UILabel!
    
    var selectedProduct:Product!
    //var selectedRoomNights:Int = 0
    
    var imgProduct: UIImage = UIImage(named: "prod_3.jpg")!
    var txtTitle: String = "Product Name"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = txtTitle
        imgProductView.image = imgProduct
        NSLog("Selected Product: %@", selectedProduct.name)
        
        /** XSIGHTin
         * Set "View_PDP" event with properties
         */
        DOX.setEventGroupName("View_PDP")
        DOX.logEvent(XEvent.builder({ (event) in
            if let evt = event as? XEvent {
                evt.setEventName("View_PDP")
                evt.setProperties(XProperties.builder({ (property) in
                    if let prop = property as? XProperties {
                        prop.set("xi_is_host", value: "Guest")  // This sample works as only Guest
                        prop.set("xi_room_id", value: self.selectedProduct.roomId)
                        prop.set("xi_name", value: self.selectedProduct.name)
                        prop.set("xi_search_id", value: self.selectedProduct.searchId)
                        prop.set("xi_city_id", value: self.selectedProduct.cityInfo.cityId)
                        prop.set("xi_city_nm", value: self.selectedProduct.cityInfo.cityName)
                        prop.set("xi_type_of_accommodation", value: self.selectedProduct.typeOfAccommodation)
                        prop.set("xi_room_type", value: self.selectedProduct.roomType)
                        prop.set("xi_bedrooms", value: self.selectedProduct.numOfBedRooms)
                        prop.set("xi_bathrooms", value: self.selectedProduct.numOfBethrooms)
                        prop.set("xi_families", value: self.selectedProduct.families)
                        prop.set("xi_kitchen_facillities", value: self.selectedProduct.kitchenFacillities)
                        prop.set("xi_entertainment", value: self.selectedProduct.entertainment)
                        prop.set("xi_room_facillities", value: self.selectedProduct.roomFacillities)
                        prop.set("xi_facilities", value: self.selectedProduct.facilities)
                        prop.set("xi_special_facilities", value: self.selectedProduct.specialFacilities)
                        prop.set("xi_booking_type", value: self.selectedProduct.bookingType)
                        prop.set("xi_cancel_policy", value: self.selectedProduct.cancelPolicy)
                        prop.set("xi_discount_id", value: self.selectedProduct.discountId)
                        prop.set("xi_discount_nm", value: self.selectedProduct.discountName)
                        prop.set("xi_discount_percent", value: self.selectedProduct.discountPercent)
                        prop.set("xi_roomrate_weekdays", value: self.selectedProduct.roomrate_weekdays)
                        prop.set("xi_roomrate_weekend", value: self.selectedProduct.roomrate_weekend)
                        prop.set("xi_number_of_review", value: self.selectedProduct.numbOfReview)
                        prop.set("xi_review_rate", value: self.selectedProduct.reviewRate)
                    }
                }))
            }
        }))
        
    }
    
    @IBAction func checkInChanged(_ sender: UIDatePicker) {
        txtCheckIn.text = dateString(from: sender.date)
        pickerCheckOut.date = sender.date
    }
    
    @IBAction func checkOutChanged(_ sender: UIDatePicker) {
        txtCheckOut.text = dateString(from: sender.date)
    }
    
    func dateString(from: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        return dateFormatter.string(from: from)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reqViewController = segue.destination as! RequestToBookViewController
        if segue.identifier == "reqToBook" {
            reqViewController.selectedReqToBook = RequestToBook.init(product: selectedProduct,
                                                                     numOfGuest: 2,
                                                                     dateBooking: Date.init(),  // Now
                                                                     dateCheckin: pickerCheckIn.date,
                                                                     dateCheckout: pickerCheckOut.date)
        }
    }
    
    @IBAction func requestToBook(_ sender: UIButton) {
        let selectedRoomNights = Calendar.current.dateComponents([.day], from: pickerCheckIn.date, to: pickerCheckOut.date).day!
        NSLog("%d Room Nights", selectedRoomNights)
        
        // Check-in date must be earlier than check-out date.
        if selectedRoomNights <= 0 {
            let warningAlert = UIAlertController(title: "Wooops",
                                                 message: "Check-in date must be earlier than check-out date.",
                                                 preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
            warningAlert.addAction(cancelAction)
            present(warningAlert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "reqToBook", sender: self)
        }
        
    }
}

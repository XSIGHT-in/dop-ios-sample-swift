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
    
    var imgProduct: UIImage = UIImage(named: "prod_3.jpg")!
    var txtTitle: String = "Product Name"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = txtTitle
        imgProductView.image = imgProduct
        NSLog("Selected Product: %@", selectedProduct.name)
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
            reqViewController.selectedReqToBook = RequestToBook.init(product: selectedProduct)
        }
        
    }
    @IBAction func requestToBook(_ sender: UIButton) {
        let roomNights:Int = Calendar.current.dateComponents([.day], from: pickerCheckIn.date, to: pickerCheckOut.date).day!
        
        NSLog("%d Room Nights", roomNights)
        self.performSegue(withIdentifier: "reqToBook", sender: self)
    }
}

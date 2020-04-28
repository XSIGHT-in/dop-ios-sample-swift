//
//  CollectionViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/27.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet var lblCollectionName: UILabel!
    
    var txtTitle: String = "Collection Name"
    var selectedCity:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = txtTitle
        lblCollectionName.text = txtTitle
        NSLog("Selected Collection: %@", selectedCity.cityName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productViewController = segue.destination as! ProductViewController
        if segue.identifier == "productFirst" {
            productViewController.imgProduct = UIImage(named: "prod_1.jpg")!
            productViewController.txtTitle = "Product #1"
            productViewController.selectedProduct = Product.init(city: selectedCity, product: Product.Name.first)
        } else {
            productViewController.imgProduct = UIImage(named: "prod_2.jpg")!
            productViewController.txtTitle = "Product #2"
            productViewController.selectedProduct = Product.init(city: selectedCity, product: Product.Name.second)
        }
    }
}

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
        
        /** XSIGHTin
         * Set "View_Collection" event with properties
         */
        DOX.setEventGroupName("View_Collection")
        DOX.logEvent(XEvent.builder({ (event) in
            if let evt = event as? XEvent {
                evt.setEventName("View_Collection")
                evt.setProperties(XProperties.builder({ (property) in
                    if let prop = property as? XProperties {
                        prop.set("xi_is_host", value: "Guest")  // This sample works as only Guest
                        prop.set("xi_city_id", value: self.selectedCity.cityId)
                        prop.set("xi_city_nm", value: self.selectedCity.cityName)
                        prop.set("xi_collection_id", value: self.selectedCity.collectionId)
                        prop.set("xi_collection_nm", value: self.selectedCity.collectionName)
                        prop.set("xi_theme_id", value: self.selectedCity.themeId)
                        prop.set("xi_theme_nm", value: self.selectedCity.themeName)
                    }
                }))
            }
        }))
        /** END of code for XSIGHTin
        */
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

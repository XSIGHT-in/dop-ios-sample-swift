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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = txtTitle
        lblCollectionName.text = txtTitle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productViewController = segue.destination as! ProductViewController
        if segue.identifier == "productFirst" {
            productViewController.imgProduct = UIImage(named: "prod_1.jpg")!
            productViewController.txtTitle = "Product #1"
        } else if segue.identifier == "productSecond" {
            productViewController.imgProduct = UIImage(named: "prod_2.jpg")!
            productViewController.txtTitle = "Product #2"
        } else {
            productViewController.imgProduct = UIImage(named: "prod_3.jpg")!
            productViewController.txtTitle = "Product #3"
        }
    }
}

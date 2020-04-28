//
//  PurchaseCompleteViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/28.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class PurchaseCompleteViewController: UIViewController {

    @IBOutlet var lblPurchaseInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackToMain(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

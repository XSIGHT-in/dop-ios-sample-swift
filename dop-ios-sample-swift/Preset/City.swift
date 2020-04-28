//
//  City.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/28.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import Foundation

/**
 * This is sample preset of City as Collection for Luxstay
 */
class City {
    enum Name {
        case paris, hcmc
    }
    
    var iam:Name
    
    var cityId:Int          // xi_city_id
    var cityName:String     // xi_city_nm
    var collectionId:Int        // xi_collection_id
    var collectionName:String   // xi_collection_nm
    var themeId:Int         // xi_theme_id
    var themeName:String    // xi_theme_nm
    
    
    // Default initialize as Paris 
    convenience init() {
        self.init(name: Name.paris)
    }
    
    init(name: Name) {
        self.iam = name
        
        if self.iam == Name.paris {
            self.cityId = 99910      // number
            self.cityName = "Paris"  // string
            self.collectionId = 90000
            self.collectionName = "Best Seller"
            self.themeId =  99991
            self.themeName = "Near By Eiffel Tower"
        } else {
            self.cityId = 99920                 // number
            self.cityName = "Ho Chi Minh City"  // string
            self.collectionId = 90000
            self.collectionName = "Best Seller"
            self.themeId =  99921
            self.themeName = "District 1"
        }
    }
}

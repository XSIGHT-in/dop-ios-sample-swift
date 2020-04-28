//
//  Product.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/28.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import Foundation

class Product {
    enum Name {
        case first, second
    }
    var cityInfo:City   // Contains xi_city_id and xi_city_nm
    
    var roomId:Int      // xi_room_id: Unique house ID
    var name:String     // xi_name: House name
    var searchId:Int    // xi_search_id: Unique id of search result
    var typeOfAccommodation:String  // xi_type_of_accommodation: Condominium, Villa, Studio APT, Entire House, Service APT, Other
    var roomType:String     // xi_room_type: "Entire home" or "Private room"
    var numOfBedRooms:Int   // xi_bedrooms: # of bedrooms
    var numOfBethrooms:Int  // xi_bathrooms: # of bethrooms
    var families: String    // xi_families: Babies, Toddlers welcome | Extra matteress | No smoking
    var kitchenFacillities:String   // xi_kitchen_facillities: Oven | Microwave | Fridge | Stove
    var entertainment: String   // xi_entertainment: Pet welcome | BBQ Grills | Natural surround | Beach view | Golf | Fishing | Pool | Private pool
    var roomFacillities: String // xi_room_facillities: Balcony | Windows | Kitchen
    var facilities: String      // xi_facilities: Wifi | Oven | Air-conditioning | Washing machine | Shampoo | Toiletories | Napkins | Bottled water | Towels | Toothpaste | Soap | Elevator | Hair dryer | Internet
    var specialFacilities: String   // xi_special_facilities: Projector | Massage chair | Smart TV | Wine cabinets
    var bookingType:String      // xi_booking_type: Request to book or Instant booking
    var cancelPolicy:String     // xi_cancel_policy: Flexible, Moderate or Strict
    var discountId:Int          // xi_discount_id: Unique ID of discount or promotion
    var discountName:String     // xi_discount_nm
    var discountPercent:Float   // xi_discount_percent
    var roomrate_weekdays:Float // xi_roomrate_weekdays: Mon-Thu room rate
    var roomrate_weekend:Float  // xi_roomrate_weekend: Fri-Sun room rate
    var numbOfReview:Int        // xi_number_of_review
    var reviewRate:Float        // xi_review_rate: avg. rates of reviews
    
    // To Be Calulated by below
    var hostId:String           // xi_host_id: ex) host1111
    var unitFee:Float           // calculation for xi_rental_fee
    var cleaningFee:Float       // xi_cleaning_fee
    var otherServiceFee:Float   // xi_other_service_fee
        
    convenience init() {
        // Set informations of default product (First Product in Paris)
        self.init(city: City.init(), product: Name.first)
    }
    
    init(city: City, product: Name) {
        if city.iam == City.Name.paris {
            if product == Name.first {
                self.roomId = 80001
                self.name = "Charming new studio near Eiffel Tower (G36)"
                self.searchId = 11241230
                self.cityInfo = city
                self.typeOfAccommodation = "Studio APT"   // Seperated by '|'
                self.roomType = "Private room"
                self.numOfBedRooms = 1
                self.numOfBethrooms = 1
                self.families = "No smoking"
                self.kitchenFacillities = "Microwave | Fridge"   // Seperated by '|'
                self.entertainment = "BBQ Grills | Golf"    // Seperated by '|'
                self.roomFacillities = "Balcony"
                self.facilities = "Napkins | Soap | Elevator | Hair dryer | Internet"
                self.specialFacilities = ""  // If you don't have any, send it as empty string NOT nil
                self.bookingType = "Instant booking"
                self.cancelPolicy = "Strict"
                self.discountId = 11245876
                self.discountName = "JANUARY"
                self.discountPercent = 8
                self.roomrate_weekdays = 92.2
                self.roomrate_weekend = 110.8
                self.numbOfReview = 13
                self.reviewRate = 4.2
                self.hostId = "host9990"
                self.unitFee = 92.2
                self.cleaningFee = 5.0
                self.otherServiceFee = 6.5
            } else {
                self.roomId = 80002
                self.name = "Logement entier grand luxe foch Maillot paris 16e"
                self.searchId = 11245830
                self.cityInfo = city
                self.typeOfAccommodation = "Entire House"   // Seperated by '|'
                self.roomType = "Private room"
                self.numOfBedRooms = 2
                self.numOfBethrooms = 1
                self.families = "Extra matteress | No smoking"
                self.kitchenFacillities = "Microwave | Fridge"   // Seperated by '|'
                self.entertainment = ""    // If you don't have any, send it as empty string NOT nil
                self.roomFacillities = "Balcony"
                self.facilities = "Napkins | Bottled water | Towels | Toothpaste | Soap | Elevator | Hair dryer | Internet"
                self.specialFacilities = ""  // If you don't have any, send it as empty string NOT nil
                self.bookingType = "Instant booking"
                self.cancelPolicy = "Moderate"
                self.discountId = 0
                self.discountName = ""
                self.discountPercent = 0
                self.roomrate_weekdays = 72.0
                self.roomrate_weekend = 72.0
                self.numbOfReview = 2
                self.reviewRate = 4.5
                self.hostId = "host9990"
                self.unitFee = 72.0
                self.cleaningFee = 4.0
                self.otherServiceFee = 4.2
            }
        } else {
            // CITY == HCMC
            if product == Name.first {
                self.roomId = 80003
                self.name = "BlaBla Orange 05 - Phòng cặp đôi lãng mạn"
                self.searchId = 11245876
                self.cityInfo = City.init(name: City.Name.hcmc)
                self.typeOfAccommodation = "Studio APT | Entire House"   // Seperated by '|'
                self.roomType = "Private room"
                self.numOfBedRooms = 2
                self.numOfBethrooms = 1
                self.families = "No smoking"
                self.kitchenFacillities = "Microwave | Fridge"   // Seperated by '|'
                self.entertainment = "BBQ Grills | Beach view | Golf"    // Seperated by '|'
                self.roomFacillities = "Balcony"
                self.facilities = "Bottled water | Towels | Toothpaste | Soap | Elevator | Hair dryer | Internet"
                self.specialFacilities = ""  // If you don't have any, send it as empty string NOT nil
                self.bookingType = "Instant booking"
                self.cancelPolicy = "Strict"
                self.discountId = 11245876
                self.discountName = "JANUARY"
                self.discountPercent = 8
                self.roomrate_weekdays = 9.58
                self.roomrate_weekend = 16.58
                self.numbOfReview = 3
                self.reviewRate = 4.5
                self.hostId = "host9999"
                self.unitFee = 50.8
                self.cleaningFee = 5.0
                self.otherServiceFee = 6.5
            } else {
                self.roomId = 80004
                self.name = "LANDMARK 81"
                self.searchId = 11245876
                self.cityInfo = City.init(name: City.Name.hcmc)
                self.typeOfAccommodation = "Studio APT | Entire House"   // Seperated by '|'
                self.roomType = "Private room"
                self.numOfBedRooms = 4
                self.numOfBethrooms = 1
                self.families = "No smoking"
                self.kitchenFacillities = "Microwave | Fridge"   // Seperated by '|'
                self.entertainment = "BBQ Grills | Beach view | Golf"    // Seperated by '|'
                self.roomFacillities = "Balcony"
                self.facilities = "Napkins | Bottled water | Towels | Toothpaste | Soap | Elevator | Hair dryer | Internet"
                self.specialFacilities = ""  // If you don't have any, send it as empty string NOT nil
                self.bookingType = "Instant booking"
                self.cancelPolicy = "Strict"
                self.discountId = 11245899
                self.discountName = "COVID-19"
                self.discountPercent = 43
                self.roomrate_weekdays = 9.58
                self.roomrate_weekend = 16.58
                self.numbOfReview = 3
                self.reviewRate = 4.5
                self.hostId = "host9998"
                self.unitFee = 10.2
                self.cleaningFee = 5.0
                self.otherServiceFee = 6.5
            }
        }
    }
}

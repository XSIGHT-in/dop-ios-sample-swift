# iOS Sample Guide (Swift) for Luxstay

## SDK V2 Installation

Download SDK v2.0 file via [this link](https://dev.azure.com/XSIGHTin/XSIGHT.in%20developer%20guide/_wiki/wikis/XSIGHT.in-developer-guide.wiki/515/iOS-Implementation-version-2.0.0).

## Initialization

Create Objetive-C Bridging Header file and add "#import <DOX/DOX.h>"

> See "dop-ios-sample-swift-Bridging-Header.h"

Apply the code for initializing the SDK to the ** application() ** function of the class in which the AppDelegate of the XCode project is defined.

> See AppDelegate.swift
> 
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    DOX.initialization(launchOptions)
    return true
}
```

## Sign-in, Sign-out and Sign-up 
> See ViewController.swift

### Sign-up

When a sign-up action occurs, logEvent() is called for collection of the event itself, and userIdentify() is performed simultaneously for gathering user information.

```swift
DOX.setEventGroupName("Sign_Up")
DOX.userIdentify(XIdentify.builder({ (identify) in
    if let iden = identify as? XIdentify {
        iden.setOnce("user_id", value: self.user.userId)
        iden.set("xi_email", value: /* string */)
        iden.set("xi_gender", value: /* string */)      // F or M
        iden.set("xi_timezone", value: /* string */)    // Country Phone Code
        iden.set("xi_fb_id", value: /* string */)
        iden.set("xi_google_id", value: /* string */)
        iden.set("xi_status", value: /* string */)      // Active or Inactive
        iden.set("xi_created_at", value: /* Date.timeIntervalSince1970 */)    // Unux Timestamp
        iden.set("xi_is_host", value: /* string */)       // Guest or Host
    }
}))

DOX.setEventGroupName("Sign_Up")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("Sign_Up")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_email", value: /* string */)
                prop.set("xi_gender", value: /* string */)      // F or M
                prop.set("xi_timezone", value: /* string */)    // Country Phone Code
                prop.set("xi_fb_id", value: /* string */)
                prop.set("xi_google_id", value: /* string */)
                prop.set("xi_status", value: /* string */)      // Active or Inactive
                prop.set("xi_created_at", value: /* Date.timeIntervalSince1970 */)    // Unux Timestamp
                prop.set("xi_is_host", value: /* string */)       // Guest or Host
            }
        }))
    }
}))
```

### Sign-in

If the login event occurs with the SDK applied, you can set the LOGIN-ID into the SDK.
The LOGIN-ID value is stored in the local storage by the SDK and is transmitted together with the stored ID information when all subsequent events are transmitted.
If the service is expected to log in and log out frequently on the same client device, We recommend resetting the setUserId () function when a logout event occurs in order to avoid analytic distortion.

```swift
DOX.setUserId(user.userId)
```

```swift
DOX.setEventGroupName("Sign_In")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("Sign_In")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_email", value: /* string */)
                prop.set("xi_gender", value: /* string */)      // F or M
                prop.set("xi_timezone", value: /* string */)    // Country Phone Code
                prop.set("xi_fb_id", value: /* string */)
                prop.set("xi_google_id", value: /* string */)
                prop.set("xi_status", value: /* string */)      // Active or Inactive
                prop.set("xi_created_at", value: /* Date.timeIntervalSince1970 */)    // Unux Timestamp
                prop.set("xi_is_host", value: /* string */)       // Guest or Host
            }
        }))
    }
}))
```

The userIdentify() function is invoked when user information is created, deleted, or changed, however, in this site, is also called from Sign_In to collect information from users who have previously subscribed.

```swift
DOX.setEventGroupName("Sign_In")
DOX.userIdentify(XIdentify.builder({ (identify) in
    if let iden = identify as? XIdentify {
        iden.setOnce("user_id", value: self.user.userId)
        iden.set("xi_email", value: /* string */)
        iden.set("xi_gender", value: /* string */)      // F or M
        iden.set("xi_timezone", value: /* string */)    // Country Phone Code
        iden.set("xi_fb_id", value: /* string */)
        iden.set("xi_google_id", value: /* string */)
        iden.set("xi_status", value: /* string */)      // Active or Inactive
        iden.set("xi_created_at", value: /* Date.timeIntervalSince1970 */)    // Unux Timestamp
        iden.set("xi_is_host", value: /* string */)       // Guest or Host
    }
            }))
```

### Sign-out
> See ViewVontroller.swift

```swift
DOX.setUserId("")
```

```swift
DOX.setEventGroupName("Sign_Out")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("Sign_Out")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* string */) // Guest or Host
            }
        }))
    }
}))
```

## Visit_Main_Page
> See ViewVontroller.swift

```swift
DOX.setEventGroupName("Visit_Main_Page")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("Visit_Main_Page")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* string */) // Guest or Host
            }
        }))
    }
}))
```

## View_Collection
> See CollectionViewController.swift

For a detailed description of the event properties, refer to the [following link](https://docs.google.com/spreadsheets/d/1-Y6R58T5vd8ulGWWpSYFgYsLp60ZCZchzYZGzHOEUeQ/edit#gid=201784628).


```swift
DOX.setEventGroupName("View_Collection")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("View_Collection")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* String */)
                prop.set("xi_city_id", value: /* Int */)
                prop.set("xi_city_nm", value: /* String */)
                prop.set("xi_collection_id", value: /* Int */)
                prop.set("xi_collection_nm", value: /* String */)
                prop.set("xi_theme_id", value: /* Int */)
                prop.set("xi_theme_nm", value: /* String */)
            }
        }))
    }
}))
```

## View_PDP
> See ProductViewController.swift

```swift
DOX.setEventGroupName("View_PDP")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("View_PDP")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* string */)
                prop.set("xi_room_id", value: /* Int */)    // Unique house ID
                prop.set("xi_name", value: /* String */)    // House name
                prop.set("xi_search_id", value: /* Int */)
                prop.set("xi_city_id", value: /* Int */)
                prop.set("xi_city_nm", value: /* String */)
                prop.set("xi_type_of_accommodation", value: /* String */)   // Condominium, Villa, Studio APT, Entire House, Service APT, Other
                prop.set("xi_room_type", value: /* String */)   // "Entire home" or "Private room"
                prop.set("xi_bedrooms", value: /* Int */)
                prop.set("xi_bathrooms", value: /* Int */)
                prop.set("xi_families", value: /* String */)    // Babies, Toddlers welcome | Extra matteress | No smoking
                prop.set("xi_kitchen_facillities", value: /* String */) // Oven | Microwave | Fridge | Stove
                prop.set("xi_entertainment", value: /* String */)   // Pet welcome | BBQ Grills | Natural surround | Beach view | Golf | Fishing | Pool | Private pool
                prop.set("xi_room_facillities", value: /* String */)    // Balcony | Windows | Kitchen
                prop.set("xi_facilities", value: /* String */)  // Wifi | Oven | Air-conditioning | Washing machine | Shampoo | Toiletories | Napkins | Bottled water | Towels | Toothpaste | Soap | Elevator | Hair dryer | Internet
                prop.set("xi_special_facilities", value: /* String */)  // Projector | Massage chair | Smart TV | Wine cabinets
                prop.set("xi_booking_type", value: /* String */)    // Request to book | Instant booking
                prop.set("xi_cancel_policy", value: /* String */)   // Flexible | Moderate | Strict
                prop.set("xi_discount_id", value: /* Int */)    // Unique ID of discount or promotion
                prop.set("xi_discount_nm", value: /* String */)
                prop.set("xi_discount_percent", value: /* Float */)
                prop.set("xi_roomrate_weekdays", value: /* Float */)    // Mon-Thu room rate
                prop.set("xi_roomrate_weekend", value: /* Float */) // Fri-Sun room rate
                prop.set("xi_number_of_review", value: /* Int */)
                prop.set("xi_review_rate", value: /* Float */)  // avg. rates of reviews
            }
        }))
    }
}))
```

## Click_Request_to_Book
> See RequestToBookViewController.swift

```swift
DOX.setEventGroupName("Click_Request_to_Book")
DOX.logEvent(XEvent.builder({ (event) in
    if let evt = event as? XEvent {
        evt.setEventName("Click_Request_to_Book")
        evt.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* String */)
                prop.set("xi_room_id", value: /* Int */)
                prop.set("xi_host_id", value: /* Int */)
                prop.set("xi_name", value: /* String */)
                prop.set("xi_search_id", value: /* Int */)
                prop.set("xi_city_id", value: /* Int */)
                prop.set("xi_city_nm", value: /* String */)
                prop.set("xi_type_of_accommodation", value: /* String */)
                prop.set("xi_room_type", value: /* String */)
                prop.set("xi_bedrooms", value: /* Int */)
                prop.set("xi_bathrooms", value: /* Int */)
                prop.set("xi_families", value: /* String */)
                prop.set("xi_kitchen_facillities", value: /* String */)
                prop.set("xi_entertainment", value: /* String */)
                prop.set("xi_room_facillities", value: /* String */)
                prop.set("xi_facilities", value: /* String */)
                prop.set("xi_special_facilities", value: /* String */)
                prop.set("xi_booking_type", value: /* String */)
                prop.set("xi_cancel_policy", value: /* String */)
                prop.set("xi_discount_id", value: /* Int */)
                prop.set("xi_discount_nm", value: /* String */)
                prop.set("xi_discount_percent", value: /* Float */)
                prop.set("xi_roomrate_weekdays", value: /* Float */)
                prop.set("xi_roomrate_weekend", value: /* Float */)
                prop.set("xi_number_of_review", value: /* Int */)
                prop.set("xi_review_rate", value: /* Float */)
                prop.set("xi_booking_id", value: /* String */)  // Unique ID
                prop.set("xi_date_booking", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_date_checkin", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_date_checkout", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_number_of_guest", value: /* Int */)
                prop.set("xi_rental_fee", value: /* Float */)
                prop.set("xi_cleaning_fee", value: /* Float */)
                prop.set("xi_other_service_fee", value: /* Float */)
                prop.set("xi_discount_apply", value: /* String */)  // True | False
                prop.set("xi_total_fee", value: /* Float */)
                prop.set("xi_request_to_book", value: /* String */) // Click | NA
            }
        }))
    }
}))
```

## Check_Out
**ATTENTION: this should be called by logRevenue() NOT logEvent()**
> See PurchaseCompleteViewController.swift

```swift
DOX.setEventGroupName("Check_Out")
DOX.logRevenue(XRevenue.builder({ (revenue) in
    if let rev = revenue as? XRevenue {
        rev.setEventType("Check_Out")
        rev.setCurcy(/* String */)  // VND, USD, etc...
        rev.setOrdNo(/* String */)  // same as xi_booking_id
        rev.setProperties(XProperties.builder({ (property) in
            if let prop = property as? XProperties {
                prop.set("xi_is_host", value: /* String */)
                prop.set("totalAmount", value: /* Float */)
                prop.set("xi_timezone", value: /* String */)    // Country phone code. ex) 84
                prop.set("xi_room_id", value: /* Int */)
                prop.set("xi_name", value: /* String */)
                prop.set("xi_search_id", value: /* Int */)
                prop.set("xi_city_id", value: /* Int */)
                prop.set("xi_city_nm", value: /* String */)
                prop.set("xi_type_of_accommodation", value: /* String */)
                prop.set("xi_room_type", value: /* String */)
                prop.set("xi_bedrooms", value: /* Int */)
                prop.set("xi_bathrooms", value: /* Int */)
                prop.set("xi_families", value: /* String */)
                prop.set("xi_kitchen_facillities", value: /* String */)
                prop.set("xi_entertainment", value: /* String */)
                prop.set("xi_room_facillities", value: /* String */)
                prop.set("xi_facilities", value: /* String */)
                prop.set("xi_special_facilities", value: /* String */)
                prop.set("xi_booking_type", value: /* String */)
                prop.set("xi_cancel_policy", value: /* String */)
                prop.set("xi_discount_id", value: /* Int */)
                prop.set("xi_discount_nm", value: /* String */)
                prop.set("xi_discount_percent", value: /* Float */)
                prop.set("xi_roomrate_weekdays", value: /* Float */)
                prop.set("xi_roomrate_weekend", value: /* Float */)
                prop.set("xi_number_of_review", value: /* Int */)
                prop.set("xi_review_rate", value: /* Float */)
                prop.set("xi_date_booking", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_date_checkin", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_date_checkout", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_number_of_guest", value: /* Int */)
                prop.set("xi_rental_fee", value: /* Float */)
                prop.set("xi_cleaning_fee", value: /* Float */)
                prop.set("xi_other_service_fee", value: /* Float */)
                prop.set("xi_discount_apply", value: /* String */)
                prop.set("xi_booking_id", value: /* String */)
                prop.set("xi_payment_type", value: /* String */)    // ex) International card
                prop.set("xi_payment_date", value: /* Date.timeIntervalSince1970 */)
                prop.set("xi_thankyoupage", value: /* String */)    // Click or NA
            }
        }))
    }
}))
```
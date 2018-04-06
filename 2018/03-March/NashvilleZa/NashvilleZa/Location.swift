//
//  Location.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import Foundation
import CoreLocation

struct Location: Codable {
    let name: String
    let rating: Int
    let latitude: Double
    let longitude: Double
    
    /// straight line distance in miles
    var distance: CLLocationDistance {
        let currentLocation: CLLocation = CLLocation(latitude: 36.174454, longitude: -86.761744) // faked location
        let zaLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        return zaLocation.distance(from: currentLocation)
    }
}

//
//  CLLocation+Extensions.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import CoreLocation

extension CLLocationDistance {
    var miles: Double {
        return self * 0.000621371
    }
    
    /// formatted distance string
    var milesString: String {
        return String(format: "%.2f miles", miles)
    }
}

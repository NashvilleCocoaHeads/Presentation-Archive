//
//  Array+Extensions.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import Foundation

extension Array where Element == Location {
    
    /// Sort locations by distance. (shortest distance first)
    ///
    /// - Returns: returns sorted array of Locations with the closest locations first
    func sortByDistance() -> [Location] {
        return self.sorted(by: { (location1: Location, location2: Location) -> Bool in
            return location1.distance < location2.distance
        })
    }
}
 

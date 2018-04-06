//
//  NashvilleZaTests.swift
//  NashvilleZaTests
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import XCTest
import CoreLocation
@testable import NashvilleZa

class NashvilleZaTests: XCTestCase {
    
    private let locations: [Location] = [
        Location(name: "Five Points Pizza", rating: 5, latitude: 36.177196, longitude: -86.750438),
        Location(name: "Luigi's City Pizza", rating: 3, latitude: 36.161238, longitude: -86.775878),
        Location(name: "Papa Johns", rating: 3, latitude: 36.166786, longitude: -86.767990),
        Location(name: "Night Train Pizza", rating: 5, latitude: 36.151734, longitude: -86.780040),
        Location(name: "Little Chicago Pizzeria", rating: 3, latitude: 36.153062, longitude: -86.790537),
        Location(name: "Vinny's Pizza", rating: 3, latitude: 36.163647, longitude: -86.780069),
        Location(name: "Manny's House of Pizza", rating: 5, latitude: 36.164354, longitude: -86.780004),
        Location(name: "Pizza Hut", rating: 2, latitude: 36.199149, longitude: -86.740257)
    ]
    
    
    // MARK: - Extension Tests
    
    func testMilesConversion() {
        let distance1: CLLocationDistance = -1000
        let distance2: CLLocationDistance = 0
        let distance3: CLLocationDistance = 1000
        
        XCTAssert(distance1.miles == -0.621371)
        XCTAssert(distance2.miles == 0)
        XCTAssert(distance3.miles == 0.621371)
    }
    
    func testMilesString() {
        let distance1: CLLocationDistance = -1000
        let distance2: CLLocationDistance = 0
        let distance3: CLLocationDistance = 1000
        
        XCTAssert(distance1.milesString == "-0.62 miles")
        XCTAssert(distance2.milesString == "0.00 miles")
        XCTAssert(distance3.milesString == "0.62 miles")
    }
    
    func testLocationsSortDistance() {
        let sortedLocations = locations.sortByDistance()
        
        XCTAssert(sortedLocations[0].name == "Papa Johns")
        XCTAssert(sortedLocations[1].name == "Five Points Pizza")
        XCTAssert(sortedLocations[2].name == "Luigi's City Pizza")
        XCTAssert(sortedLocations[3].name == "Manny's House of Pizza")
        XCTAssert(sortedLocations[4].name == "Vinny's Pizza")
        XCTAssert(sortedLocations[5].name == "Night Train Pizza")
        XCTAssert(sortedLocations[6].name == "Pizza Hut")
        XCTAssert(sortedLocations[7].name == "Little Chicago Pizzeria")
    }
    
    
    // MARK: - Data Source Tests
    
    func testDataSourceCount() {
        let dataSource1 = LocationsDataSource(with: [])
        XCTAssert(dataSource1.tableView(UITableView(), numberOfRowsInSection: 0) == 0)
        
        let dataSource2 = LocationsDataSource(with: locations)
        XCTAssert(dataSource2.tableView(UITableView(), numberOfRowsInSection: 0) == 8)
    }
    
    func testPerformanceExample() {
        self.measure {
            _ = locations.sortByDistance()
        }
    }
    
}

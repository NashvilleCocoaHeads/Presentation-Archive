//
//  LocationsDataSource.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import UIKit

class LocationsDataSource: NSObject, UITableViewDataSource {
    
    private let locations: [Location]
    
    init(with locations: [Location]) {
        self.locations = locations
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.cellReuseIdentifier, for: indexPath)
        
        if let locationCell = cell as? LocationTableViewCell {
            locationCell.configureCell(with: locations[indexPath.row])
            return locationCell
        }
        
        return cell
    }
}

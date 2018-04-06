//
//  LocationsTableViewController.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    private let dataSource: UITableViewDataSource
    
    init(with dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
        
        super.init(style: .plain)
        
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.cellReuseIdentifier)
        tableView.dataSource = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

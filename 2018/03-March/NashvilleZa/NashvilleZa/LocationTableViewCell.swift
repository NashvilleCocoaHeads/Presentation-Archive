//
//  LocationTableViewCell.swift
//  NashvilleZa
//
//  Created by Addison Webb on 3/28/18.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    static let cellReuseIdentifier = "LocationTableViewCell"
    
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let distanceLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // enable autolayout
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // add views to view hierarchy
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(distanceLabel)
        
        distanceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // layout
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: distanceLabel.leadingAnchor, constant: -8.0),
            nameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            nameLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -8.0),
            
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8.0),
            
            distanceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8.0),
            distanceLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
            ])
        
        accessoryType = .disclosureIndicator
    }
    
    func configureCell(with location: Location) {
        nameLabel.text = location.name
        ratingLabel.text = "Rating: \(location.rating)"
        distanceLabel.text = location.distance.milesString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LocationCollectionViewCell.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(locationImageView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(distanceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            locationImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            locationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            addressLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            distanceLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
            distanceLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            distanceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with location: Location) {
        addressLabel.text = location.address
        addressLabel.textColor = .blue
    }
}

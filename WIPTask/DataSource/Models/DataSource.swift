//
//  DataSource.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation

// MARK: - DataSource
struct DataSource: Codable {
    let status: String
    let locations: [Location]
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double?
    let label, address: String
    let image: String?
    let latitude, longitude: Double?
}

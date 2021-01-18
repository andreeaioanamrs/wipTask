//
//  DataFetcher.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation

class DataFetcher {
    
    static func fetchData() -> [Location]? {
        guard let locations = UserDefaults.standard.locations,
              !locations.isEmpty else {
            let url = Bundle.main.url(forResource: "AllLocations", withExtension: "json")!
            do {
                let jsonData = try Data(contentsOf: url)

                let dataSource = try? JSONDecoder().decode(DataSource.self, from: jsonData)
                UserDefaults.standard.locations = dataSource?.locations
                return dataSource?.locations
            } catch {
                print(error)
            }
            return []
        }

        return locations
    }
    
}

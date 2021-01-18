//
//  DataFetcher.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation

class DataFetcher {
    
    static func fetchData() -> DataSource? {
        let url = Bundle.main.url(forResource: "AllLocations", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)

            let dataSource = try? JSONDecoder().decode(DataSource.self, from: jsonData)
            return dataSource
        } catch {
            print(error)
        }
        
        return nil
    }
    
}

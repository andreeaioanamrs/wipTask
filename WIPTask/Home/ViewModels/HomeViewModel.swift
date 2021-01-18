//
//  HomeViewModel.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation
import RxRelay

class HomeViewModel {
    let coordinator: HomeCoordinator
    
    let locations = BehaviorRelay<[Location]>(value: [])
    
    let isAddLocationHidden = BehaviorRelay(value: true)

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        
        locations.accept(DataFetcher.fetchData() ?? [])
    }
    
    func showDetails(forLocationAt index: Int) {
        let location = locations.value[index]
        
        coordinator.showDetails(for: location)
    }
    
    @objc func showAddLocation() {
        isAddLocationHidden.accept(false)
    }
    
    func addNewLocation(_ name: String?, address: String?, lat: Double?, lng: Double?) {
        guard let name = name,
              let address = address else { return }
        
        isAddLocationHidden.accept(true)
        let newLocation = Location(lat: lat,
                                   lng: lng,
                                   label: name,
                                   address: address,
                                   image: nil,
                                   latitude: nil,
                                   longitude: nil)
        
        var allLocations = locations.value
        allLocations.append(newLocation)
        locations.accept(allLocations)
        UserDefaults.standard.locations = allLocations
    }
    
    func cancelAddLocation() {
        isAddLocationHidden.accept(true)
    }
    
}

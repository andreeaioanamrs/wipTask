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

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        
        locations.accept(DataFetcher.fetchData() ?? [])
    }
    
    func showDetails(forLocationAt index: Int) {
        let location = locations.value[index]
        
        coordinator.showDetails(for: location)
    }
    
}

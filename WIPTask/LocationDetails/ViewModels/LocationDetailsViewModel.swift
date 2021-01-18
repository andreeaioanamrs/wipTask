//
//  LocationDetailsViewModel.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import RxRelay

class LocationDetailsViewModel {
    let coordinator: LocationDetailsCoordinator
    let location: BehaviorRelay<Location>

    init(coordinator: LocationDetailsCoordinator, location: Location) {
        self.coordinator = coordinator
        self.location = BehaviorRelay(value: location)
    }
    
}

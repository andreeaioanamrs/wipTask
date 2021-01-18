//
//  LocationDetailsCoordinator.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

class LocationDetailsCoordinator: Coordinator {
    
    let location: Location
    
    init(location: Location,
         parentCoordinator: Coordinator?,
         navigationController: UINavigationController) {
        self.location = location
        super.init(navigationController: navigationController, parentCoordinator: parentCoordinator)
    }
    
    override func start() {
        transition(to: .locationDetails(LocationDetailsViewModel(coordinator: self, location: location)))
    }
    
}

//
//  HomeCoordinator.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation

class HomeCoordinator: Coordinator {
    
    override func start() {
        transition(to: .home(HomeViewModel(coordinator: self)))
    }
    
    func showDetails(for location: Location) {
        let coordinator = LocationDetailsCoordinator(location: location,
                                                     parentCoordinator: self,
                                                     navigationController: navigationController)
        coordinator.start()
    }
    
}

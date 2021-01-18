//
//  Coordinator.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

class Coordinator: NSObject {
    let navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        assertionFailure("Start should be implemented in child")
    }
    
    
    func transition(to scene: Scene, animated: Bool = true) {
        let viewController = scene.viewController()
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func goBack(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
}

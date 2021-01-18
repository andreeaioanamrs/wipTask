//
//  Scene.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

enum Scene {
    case home(HomeViewModel)
    case locationDetails(LocationDetailsViewModel)
}

extension Scene {
    
    typealias BindableViewController = UIViewController & BindableType
    
    func viewController() -> UIViewController {
        switch self {
        case .home(let viewModel):
            return bind(viewController: ViewController(), viewModel: viewModel)
        case .locationDetails(let viewModel):
            return bind(viewController: LocationDetailsViewController(), viewModel: viewModel)
        }
    }
    
    private func bind<T:BindableViewController>(viewController: T, viewModel: T.ViewModelType) -> T {
        viewController.viewModel = viewModel
        viewController.bindViewModel()
        return viewController
    }
    
}

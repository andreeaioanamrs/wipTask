//
//  AppDelegate.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 17/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let navigationController = UINavigationController()
        HomeCoordinator(navigationController: navigationController, parentCoordinator: nil).start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        DataFetcher.fetchData()
        return true
    }

}


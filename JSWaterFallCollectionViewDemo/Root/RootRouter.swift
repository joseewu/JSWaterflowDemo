//
//  RootRouter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/1.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
class RootRouter: RootRouting {
    weak var window: UIWindow?

    func presentListScreen() {
        let serive:HomeService = HomeService()
        let navigationController = UINavigationController(rootViewController: JSTracksModuleFactory.makeModule(service: serive))
        navigationController.navigationBar.isTranslucent = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

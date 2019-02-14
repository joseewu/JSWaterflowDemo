//
//  RootModuleFactory.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/1.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit

class RootModuleFactory {
    static func makeModule(in window: UIWindow?) {
        let router = RootRouter()
        router.window = window
        let presenter = RootPresenter(router: router)
        presenter.start()
    }
}

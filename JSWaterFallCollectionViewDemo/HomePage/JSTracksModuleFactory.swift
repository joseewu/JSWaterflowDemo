//
//  JSTracksModuleFactory.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/1.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import UIKit
class JSTracksModuleFactory {
    static func makeModule(service: HomeServiceSpec) -> UIViewController {
        let router = JSTracksRouter()
        let interactor = JSTracksInteractor(with: service)
        let presenter = JSTracksPresenter(interactor: interactor, router: router)
        let viewController = JSTracksViewController(presenter: presenter)
        router.viewController = viewController
        return viewController
    }
}

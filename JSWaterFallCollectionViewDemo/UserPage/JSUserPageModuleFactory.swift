//
//  JSUserPageModuleFactory.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/14.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class JSUserPageModuleFactory {
    static func makeModule() -> UIViewController{

        let router = JSUserPageRouter()
        let interactor = JSUserInteractor()
        let presenter = JSUserPagePresenter(interactor: interactor, router: router)
        let viewController = JSUserPageViewController(presenter: presenter)
        router.viewController = viewController

        return viewController
    }
}

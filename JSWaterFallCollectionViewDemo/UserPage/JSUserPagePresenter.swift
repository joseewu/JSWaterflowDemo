//
//  JSUserPagePresenter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/14.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
class JSUserPagePresenter: JSUserPresentings {
    private let router: JSUserRouting
    private let interactor: JSUserInteracting
    init(interactor: JSUserInteracting, router: JSUserRouting) {
        self.interactor = interactor
        self.router = router
    }
}

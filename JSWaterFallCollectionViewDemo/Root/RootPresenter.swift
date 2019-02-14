//
//  RootPresenter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/1.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
class RootPresenter {

    // MARK: - Variables

    private let router: RootRouting

    // MARK: - Init

    init(router: RootRouting) {
        self.router = router
    }

    func start() {
        router.presentListScreen()
    }
}

//
//  RootContract.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/1.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit

protocol RootRouting: class {
    var window: UIWindow? { get set }
    func presentListScreen()
}

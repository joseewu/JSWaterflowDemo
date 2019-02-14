//
//  ViewModelType.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation

protocol ViewModelBinding {
    associatedtype Inputs
    associatedtype Outputs
    var inputs: Inputs {get}
    var outputs: Outputs {get}
}

protocol ViewModelDependency {
    associatedtype Denpendency
    init(withDependency dependency: Denpendency)
}

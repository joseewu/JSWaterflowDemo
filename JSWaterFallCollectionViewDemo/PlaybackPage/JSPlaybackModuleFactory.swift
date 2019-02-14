//
//  JSPlaybackModuleFactory.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class JSPlaybackModuleFactory {
    static func makeModule(with trackModel:JSPhotoCollectionViewCellModel) -> UIViewController{

        let router = JSPlayerbackRouting()
        let interactor = JSPlaybackInterctor()
        let presenter = JSPlaybackPresenter(withInteractor: interactor, andRouter: router)
        let viewController = JSPlaybackPageController(presenter: presenter)
        presenter.track.onNext(trackModel)
        router.viewController = viewController
        
        return viewController
    }
}

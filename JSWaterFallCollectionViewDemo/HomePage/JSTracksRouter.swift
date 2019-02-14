//
//  JSTracksRouter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
class JSTracksRouter:TracksRouting {
    weak var viewController: UIViewController?
    func presentPlaybackPage(with chooseTrack: JSPhotoCollectionViewCellModel) {
        let vc = JSPlaybackModuleFactory.makeModule(with: chooseTrack)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    func presentEmpty() {
        let vc = JSUserPageModuleFactory.makeModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

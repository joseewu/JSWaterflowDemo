//
//  JSPlaybackContract.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import AVFoundation

protocol PlaybackPresenting {
    var viewDidAppear:PublishSubject<Void> {get set}
    var track:PublishSubject<JSPhotoCollectionViewCellModel> {get set}
    var playerData:Driver<Data?> { get }
    init(withInteractor interactor:PlaybackInteracting, andRouter router:PlaybackRouting)
}

protocol PlaybackInteracting: class {
    var songUrl:PublishSubject<URL?> { get }
    var playerData:Driver<Data?> { get }
}

protocol PlaybackRouting: class {
    var viewController: UIViewController? { get set }
}

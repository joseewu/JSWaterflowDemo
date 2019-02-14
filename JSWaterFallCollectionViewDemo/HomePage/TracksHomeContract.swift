//
//  TracksHomeContract.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

//view model input
protocol TracksPresenting:class {
    var viewDidAppear:PublishSubject<Void> {get set}
    var chooseTrack:PublishSubject<IndexPath> {get set}
    var tracks:[JSPhotoCollectionViewCellModel] {get}
    var update:Driver<Void> {get}
    var collectionViewSize:[CGSize] {get}
    var error:Driver<String?> {get}
}
//handle view's user interaction
protocol TracksInteracting: class {
    var tracks:Observable<[TrackModel]> {get}
    var error:Observable<ServiceError?> {get}
    var fetch:PublishSubject<Void> {get set}
}

protocol TracksRouting: class {
    var viewController: UIViewController? { get set }
    func presentPlaybackPage(with chooseTrack:JSPhotoCollectionViewCellModel)
    func presentEmpty()
}

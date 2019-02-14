//
//  JSTracksInteractor.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class JSTracksInteractor:TracksInteracting {

    var tracks: Observable<[TrackModel]>

    var error: Observable<ServiceError?>

    var fetch: PublishSubject<Void> = PublishSubject.init()

    init(with service:HomeServiceSpec) {
        tracks = fetch.asObservable().flatMapLatest({ _ -> Observable<[TrackModel]> in
            return service.getPromotTracks()
        })
        error = Observable.just(nil)
    }

}

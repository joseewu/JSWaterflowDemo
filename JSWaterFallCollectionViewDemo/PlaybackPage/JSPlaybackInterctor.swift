//
//  JSPlaybackInterctor.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import AVFoundation
import Alamofire
import RxAlamofire

class JSPlaybackInterctor: PlaybackInteracting {
    var songUrl: PublishSubject<URL?> = PublishSubject.init()
    var playerData: Driver<Data?>
    let disposeBag:DisposeBag = DisposeBag()
    private let playerDataSubject:PublishSubject<Data?> = PublishSubject.init()
    init() {
        playerData = playerDataSubject.asDriver(onErrorJustReturn: nil)
        setUp()
    }
    func setUp() {
        songUrl.asObservable().flatMapLatest { (url) -> Observable<Data?> in
            guard let url = url else {return Observable.just(nil)}
            let para = ["client_id":"70dd6cb1f3807a0d2032161d666b5f87"]
            let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
            guard let request = try? URLRequest(url: url, method: .get, headers: para) else {return Observable.empty()}
            let result = RxAlamofire.request(.get,url, parameters: para, encoding: URLEncoding.default, headers: nil).responseData().flatMapLatest({ (response, data) -> Observable<Data?> in
                return Observable.just(data)
            })
            return result
            }.bind(to: playerDataSubject).disposed(by: disposeBag)
    }
    deinit {
        print("interactor gone")
    }
    
}

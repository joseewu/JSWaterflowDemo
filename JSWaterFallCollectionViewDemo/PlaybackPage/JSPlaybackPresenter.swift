//
//  JSPlaybackPresenter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class JSPlaybackPresenter: PlaybackPresenting {
    var playerData: Driver<Data?>
    var imageData: Driver<String?>

    var track: PublishSubject<JSPhotoCollectionViewCellModel> = PublishSubject.init()

    var viewDidAppear: PublishSubject<Void> = PublishSubject.init()

    private let router: PlaybackRouting
    private let interactor: PlaybackInteracting
    let disposeBag:DisposeBag = DisposeBag()

    private let playerDataSubject:PublishSubject<Data?> = PublishSubject.init()
    private let imageDataSubject:PublishSubject<String?> = PublishSubject.init()

    required init(withInteractor interactor: PlaybackInteracting, andRouter router: PlaybackRouting) {
        self.interactor = interactor
        self.router = router
        playerData = playerDataSubject.asDriver(onErrorJustReturn: nil)
        imageData = imageDataSubject.asDriver(onErrorJustReturn: nil)
        self.interactor.playerData.drive(onNext: { [weak self] data in
            self?.playerDataSubject.onNext(data)
        }).disposed(by: disposeBag)
        setUp()
    }
    func setUp() {
        track.asObservable().subscribe(onNext: { [weak self] (model) in
            self?.imageDataSubject.onNext(model.img)
            if let url = URL(string: model.songUrl) {
                self?.interactor.songUrl.onNext(url)
            }
        }, onError: { [weak self] (error) in
            self?.playerDataSubject.onError(error)
        }).disposed(by: disposeBag)

    }
    deinit {
        print("presentor gone")
    }
}

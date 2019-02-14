//
//  JSTracksPresenter.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class JSTracksPresenter: TracksPresenting {
    var chooseTrack: PublishSubject<IndexPath> = PublishSubject.init()


    var viewDidAppear: PublishSubject<Void> = PublishSubject.init()
    var update: Driver<Void>
    var tracks: [JSPhotoCollectionViewCellModel] = [JSPhotoCollectionViewCellModel]()
    var error: Driver<String?>

    private let router: TracksRouting
    private let interactor: TracksInteracting

    private let updatePublish:PublishSubject<Void> = PublishSubject.init()
    private let errorPublish:PublishSubject<String?> = PublishSubject.init()
    private let screenWidth = UIScreen.main.bounds.size.width
    let disposeBag:DisposeBag = DisposeBag()
    var collectionViewSize:[CGSize] = [CGSize]()
    init(
        interactor: TracksInteracting,
        router: TracksRouting
        ) {
        self.interactor = interactor
        self.router = router
        error = errorPublish.asDriver(onErrorJustReturn: nil)
        update = updatePublish.asDriver(onErrorJustReturn: ())
        setUp()
    }
    func setUp() {
        viewDidAppear
            .asObservable()
            .subscribe(onNext: { _ in
            self.interactor.fetch.onNext(())
        }).disposed(by: disposeBag)
        self.interactor.tracks.asObservable().subscribe(onNext: { [weak self] (result) in
            self?.tracks = result.map({ (model) -> JSPhotoCollectionViewCellModel in

                return JSPhotoCollectionViewCellModel.init(img: model.artwork ?? "", songUrl: model.streamingUrl ?? "")

            })
            self?.prepareCellSize(with: result.count)
            self?.updatePublish.onNext(())
        }, onError: { (error) in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
        chooseTrack
            .asObservable()
            .subscribe(onNext: { [weak self] index in
                if let chooseData = self?.tracks[index.row] {
                    self?.router.presentPlaybackPage(with: chooseData)
//                    self?.router.presentEmpty()
                }
            }).disposed(by: disposeBag)
    }
    func prepareCellSize(with count:Int) {
        collectionViewSize = []
        for _ in 0..<count {
            let width1 = Int.random(in: Int(screenWidth/3) ..< Int(screenWidth*2/3))
            let width2 = Int(screenWidth) - width1
            var size = CGSize.zero
            var size2 = CGSize.zero
            let hight = Int.random(in: 200 ..< 250)

            size.height = CGFloat(hight)
            size2.height = CGFloat(hight)

            size.width = CGFloat(width1)
            size2.width = CGFloat(width2)

            collectionViewSize.append(size)
            collectionViewSize.append(size2)
        }

    }
}

//
//  JSPlaybackPageController.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
import AVFoundation
import RxSwift
import RxCocoa

class JSPlaybackPageController: UIViewController {
    let presenter:JSPlaybackPresenter
    var avplayer:AVAudioPlayer?
    let disposeBag:DisposeBag = DisposeBag()
    init(presenter: JSPlaybackPresenter) {
        self.presenter = presenter
        super.init(nibName: "JSPlaybackPageController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.playerData.drive(onNext: { [weak self] (data) in
            guard let data = data else {return}
            self?.avplayer = try? AVAudioPlayer(data: data)
            self?.avplayer?.play()
        }).disposed(by: disposeBag)
    }
    deinit {
        avplayer?.stop()
    }
}

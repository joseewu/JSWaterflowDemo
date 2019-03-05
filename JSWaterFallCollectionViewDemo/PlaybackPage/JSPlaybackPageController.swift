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
import SDWebImage

class JSPlaybackPageController: UIViewController {
    let presenter:JSPlaybackPresenter
    var avplayer:AVAudioPlayer?
    @IBOutlet weak var ivCover: UIImageView!
    let disposeBag:DisposeBag = DisposeBag()
    var coverImg:String?
    let loadingAcitivity:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    init(presenter: JSPlaybackPresenter) {
        self.presenter = presenter
        super.init(nibName: "JSPlaybackPageController", bundle: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadingAcitivity.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loadingAcitivity.style = .whiteLarge
        loadingAcitivity.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loadingAcitivity.layer.cornerRadius = 10
        loadingAcitivity.clipsToBounds = true
        view.addSubview(loadingAcitivity)
        loadingAcitivity.startAnimating()
        presenter.playerData.drive(onNext: { [weak self] (data) in
            guard let data = data else {return}
            self?.loadingAcitivity.stopAnimating()
            self?.avplayer = try? AVAudioPlayer(data: data)
            self?.avplayer?.play()
        }).disposed(by: disposeBag)
        guard let coverImg = coverImg else {
            return
        }
        ivCover.contentMode = .scaleAspectFill
        ivCover.clipsToBounds = true
        ivCover.sd_setImage(with: URL(string: coverImg)) { (_, _, _, _) in

        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadingAcitivity.center = view.center
    }
    deinit {
        avplayer?.stop()
    }
}

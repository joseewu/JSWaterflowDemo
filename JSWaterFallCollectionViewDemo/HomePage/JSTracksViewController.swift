//
//  JSTracksViewController.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/14.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class JSTracksViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let layout = UICollectionViewFlowLayout()
    let screenWidth = UIScreen.main.bounds.size.width
    let disposeBag:DisposeBag = DisposeBag()
    let presenter:TracksPresenting
    
    init(presenter: TracksPresenting) {
        self.presenter = presenter
        super.init(nibName: "JSTracksViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(UINib(nibName: "JSPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JSPhotoCollectionViewCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        presenter.update.drive(onNext: { [weak self] _ in
            self?.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidAppear.onNext(())
    }
}

extension JSTracksViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.tracks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vm = presenter.tracks[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JSPhotoCollectionViewCell", for: indexPath) as? JSPhotoCollectionViewCell
        cell?.set(with: vm)
        cell?.tapToLike = { isTapped in
            print(indexPath.row)
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1
        }
    }


}

extension JSTracksViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = presenter.collectionViewSize[indexPath.row]
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.chooseTrack.onNext(indexPath)
    }

}

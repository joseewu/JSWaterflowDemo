//
//  JSPhotoCollectionViewCell.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/2/7.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit

class JSPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivPhoto: UIImageView!
    var tapToLike:((_ isTapped:Bool) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPhoto.contentMode = .scaleAspectFill
        ivPhoto.backgroundColor = UIColor.black
        ivPhoto.clipsToBounds = true
        let doubleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapToLike))
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)
    }
    @objc func doubleTapToLike() {
        print("like!!!")
        tapToLike?(true)
    }
    func set(with vm:JSPhotoCollectionViewCellModel) {
        let imgLarge = vm.getLargeImgUrl()
        ivPhoto.sd_setImage(with: URL(string: imgLarge), placeholderImage: UIImage(named: "Star"), options: .init(rawValue: 0)) { (_, _, _, _) in

        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        alpha = 0
    }

}

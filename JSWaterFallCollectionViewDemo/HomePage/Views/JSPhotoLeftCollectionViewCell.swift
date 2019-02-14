//
//  JSPhotoLeftCollectionViewCell.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/18.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage
class JSPhotoLeftCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPhoto.contentMode = .scaleAspectFill
        ivPhoto.clipsToBounds = true
    }
    func set(with vm:JSPhotoCollectionViewCellModel) {
        let imgLarge = vm.getLargeImgUrl()
        ivPhoto.sd_setImage(with: URL(string: imgLarge), placeholderImage: UIImage(named: "Star"), options: .init(rawValue: 0)) { (_, _, _, _) in

        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

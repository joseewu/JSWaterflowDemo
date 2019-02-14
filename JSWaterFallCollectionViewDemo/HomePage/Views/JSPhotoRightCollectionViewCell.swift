//
//  JSPhotoRightCollectionViewCell.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/18.
//  Copyright © 2019 com.js. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage

struct JSPhotoCollectionViewCellModel {
    let img:String
    let songUrl:String
    func getLargeImgUrl() -> String {
        guard var urlComponent = URLComponents(string: img) else {return ""}
        let path = urlComponent.path
        let modifiedPath = path.replacingOccurrences(of: "large", with: "t500x500")
        urlComponent.path = modifiedPath
        let modifiedURL = urlComponent.string
        return modifiedURL ?? ""
    }
}
class JSPhotoRightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPhoto.contentMode = .scaleAspectFill
        ivPhoto.backgroundColor = UIColor.black
        ivPhoto.clipsToBounds = true
    }
    func set(with vm:JSPhotoCollectionViewCellModel) {
        let imgLarge = vm.getLargeImgUrl()
        ivPhoto.sd_setImage(with: URL(string: imgLarge), placeholderImage: UIImage(named: ""), options: .init(rawValue: 0)) { (_, _, _, _) in

        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        alpha = 0
    }

}

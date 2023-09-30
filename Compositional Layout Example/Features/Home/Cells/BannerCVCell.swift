//
//  BannerCVCell.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class BannerCVCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var bannerImgVw: UIImageView!
    
    //MARK: - Variables
    //Data bind
    var bannerData : Banner_list? {
        didSet {
            let image = "https://cms.cashaly.com/storage/panel/banner/\(self.bannerData?.image ?? "")"
            self.contentView.cornerRadius = 8
            self.bannerImgVw.downloadImage(url: image)
        }
    }
    
    //MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}

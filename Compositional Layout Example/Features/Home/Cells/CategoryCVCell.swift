//
//  CategoryCVCell.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var categoryImgVw: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    //MARK: - Variables
    //Data bind
    var categoryObj: Category_list? {
        didSet {
            let image = "https://cms.cashaly.com/storage/panel/cat_subcat/\(self.categoryObj?.category_image ?? "")"
            self.categoryImgVw.downloadImage(url: image)
            self.categoryLbl.text = self.categoryObj?.name ?? ""
        }
    }
    
    //MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.categoryImgVw.cornerRadius = 25
    }

}

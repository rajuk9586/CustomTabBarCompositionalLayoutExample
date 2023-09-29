//
//  CategoryCVCell.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {

    @IBOutlet weak var categoryImgVw: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.categoryImgVw.cornerRadius = 25
    }

}

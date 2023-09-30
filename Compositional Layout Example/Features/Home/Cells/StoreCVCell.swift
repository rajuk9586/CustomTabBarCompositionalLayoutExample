//
//  StoreCVCell.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class StoreCVCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var categoryImgVw: UIImageView!
    @IBOutlet weak var mainVw: UIView!
    @IBOutlet weak var shadowVw: UIView!
    @IBOutlet weak var categoryLbl: UILabel!

    //MARK: - Variables
    //Data bind
    var storeObj: Store_list? {
        didSet {
            let image = "https://cms.cashaly.com/storage/panel/store/\(self.storeObj?.logo ?? "")"
            self.categoryImgVw.downloadImage(url: image)
            if self.storeObj?.rewarde_unit == "AMOUNT" {
                self.categoryLbl.text = "Rs.\(self.storeObj?.max_rewards ?? 0) Cashback"
            }else {
                self.categoryLbl.text = "\(self.storeObj?.max_rewards ?? 0)% Cashback"
            }
        }
    }
    
    //MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Apply shadow
        self.shadowVw.layer.shadowColor = UIColor.gray.cgColor
        self.shadowVw.layer.shadowOpacity = 0.5
        self.shadowVw.layer.shadowOffset = CGSize(width: 3, height: 3) // Adjust these values as needed
        self.shadowVw.layer.shadowRadius = 5
               
        // Make sure to set masksToBounds to false to allow the shadow to be visible
        self.shadowVw.layer.masksToBounds = false
        
        self.categoryImgVw.cornerRadius = 6
    }

}

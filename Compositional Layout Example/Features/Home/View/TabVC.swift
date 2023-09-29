//
//  TabVC.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class TabVC: UIViewController {

    //MARK: -IBOutlets
    @IBOutlet weak var controllerVw: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet var bottomImgVw: [UIImageView]!
    @IBOutlet var bottomLbls: [UILabel]!
    @IBOutlet var bottomTabButton: [UIButton]!
    
    //MARK: -Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeBtn.layer.borderColor = UIColor.yellow.cgColor
        self.highlightHome()
    }
    
    //MARK: -Functions
    //Add Controller
    private func addController(vc: UIViewController) {
        vc.view.alpha = 0.0
        self.addChild(vc)
        self.controllerVw.addSubview(vc.view)
        vc.view.frame = self.controllerVw.bounds
        vc.didMove(toParent: self)
        
        UIView.animate(withDuration: 0.3) {
            vc.view.alpha = 1.0
        }
    }
    
    //Remove Controller
    private func removeController(vc: UIViewController) {
        UIView.animate(withDuration: 0.3) {
            vc.view.alpha = 0.0
        } completion: { _ in
            vc.view.alpha = 1.0
            vc.willMove(toParent: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
    }
    
    //Controller functions
    private func highlightHome() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeVC") as! HomeVC
        self.homeBtn.layer.borderWidth = 1.0
        for image in self.bottomImgVw {
            image.tintColor = .iconColor
        }
        for lbl in self.bottomLbls {
            lbl.textColor = .iconColor
        }
        if let currentVc = children.first {
            self.removeController(vc: currentVc)
        }
        self.addController(vc: vc)
    }
    
    private func highlightDealOfDay() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DealOfDayVC") as! DealOfDayVC
        self.homeBtn.layer.borderWidth = 0.0
        for image in self.bottomImgVw {
            image.tintColor = .iconColor
        }
        self.bottomImgVw[0].tintColor = .iconSelectedColor
        for lbl in self.bottomLbls {
            lbl.textColor = .iconColor
        }
        self.bottomLbls[0].textColor = .iconSelectedColor
        if let currentVc = children.first {
            self.removeController(vc: currentVc)
        }
        self.addController(vc: vc)
    }
    
    private func highlightCategory() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CategoryVC") as! CategoryVC
        self.homeBtn.layer.borderWidth = 0.0
        for image in self.bottomImgVw {
            image.tintColor = .iconColor
        }
        self.bottomImgVw[1].tintColor = .iconSelectedColor
        for lbl in self.bottomLbls {
            lbl.textColor = .iconColor
        }
        self.bottomLbls[1].textColor = .iconSelectedColor
        if let currentVc = children.first {
            self.removeController(vc: currentVc)
        }
        self.addController(vc: vc)
    }
    
    private func highlightReferEarn() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ReferEarnVC") as! ReferEarnVC
        self.homeBtn.layer.borderWidth = 0.0
        for image in self.bottomImgVw {
            image.tintColor = .iconColor
        }
        self.bottomImgVw[2].tintColor = .iconSelectedColor
        for lbl in self.bottomLbls {
            lbl.textColor = .iconColor
        }
        self.bottomLbls[2].textColor = .iconSelectedColor
        if let currentVc = children.first {
            self.removeController(vc: currentVc)
        }
        self.addController(vc: vc)
    }
    private func highlightAccount() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AccountVC") as! AccountVC
        self.homeBtn.layer.borderWidth = 0.0
        for image in self.bottomImgVw {
            image.tintColor = .iconColor
        }
        self.bottomImgVw[3].tintColor = .iconSelectedColor
        for lbl in self.bottomLbls {
            lbl.textColor = .iconColor
        }
        self.bottomLbls[3].textColor = .iconSelectedColor
        if let currentVc = children.first {
            self.removeController(vc: currentVc)
        }
        self.addController(vc: vc)
    }
    
    //Set controller on Bottom Bar button Action
    private func setTabBar(index: Int) {
        switch index {
        case 0:
            self.highlightDealOfDay()
        case 1:
            self.highlightCategory()
        case 2:
            self.highlightHome()
        case 3:
            self.highlightReferEarn()
        default:
            self.highlightAccount()
        }
    }
    
    //MARK: -IBActions
    @IBAction func onClickTabButton(_ sender: UIButton) {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        self.setTabBar(index: sender.tag)
    }

}

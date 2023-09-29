//
//  HomeVC.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var headerVw: UIView!
    @IBOutlet weak var collectionVw: UICollectionView!
    
    var home_data: HomeBase?
    var isShowAll = false
    var timer: Timer?
    var currentPageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.registerCell()
        self.configureCompositionalLayout()
        self.loadJSONDataFromFile()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopTimer()
    }
    
    private func initialSetup() {
        self.headerVw.cornerRadius = 30
        self.headerVw.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func registerCell() {
        self.collectionVw.translatesAutoresizingMaskIntoConstraints = false
        self.collectionVw.delegate = self
        self.collectionVw.dataSource = self
        self.collectionVw.register(UINib(nibName: "BannerCVCell", bundle: nil), forCellWithReuseIdentifier: "BannerCVCell")
        self.collectionVw.register(UINib(nibName: "CategoryCVCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCVCell")
        self.collectionVw.register(UINib(nibName: "StoreCVCell", bundle: nil), forCellWithReuseIdentifier: "StoreCVCell")
        self.collectionVw.register(UINib(nibName: "StoreHeaderCVCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoreHeaderCVCell")
    }
    
    //Start timer for automatic scroll
    private func startTimer() {
            self.stopTimer()
            self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                let totalCount = self.home_data?.banner_list?.count ?? 0
                guard totalCount > 0 else {
                    return
                }
                
                let nextPage = (self.currentPageIndex + 1) % totalCount
                let indexPath = IndexPath(item: nextPage, section: 0)
                
                // Use the `scrollToItem(at:animated:)` method to enable infinite scrolling
                self.collectionVw.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                self.currentPageIndex = nextPage
            }
        }
    
        private func stopTimer() {
            self.timer?.invalidate()
            self.timer = nil
        }
    
    //set layout of collection view
    private func configureCompositionalLayout() {
        let collection_layout = UICollectionViewCompositionalLayout {sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return Layouts.shared.offerBannerSection()
            case 1:
                return Layouts.shared.categoryListLayout()
            default:
                return Layouts.shared.storeListLayout()
            }
            
        }
        self.collectionVw.setCollectionViewLayout(collection_layout, animated: true)
    }
    
    // Define a function to read JSON data from a file and decode it
    func loadJSONDataFromFile() {
        if let fileURL = Bundle.main.url(forResource: "Home_data", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                self.home_data = try decoder.decode(HomeBase.self, from: jsonData)
                self.collectionVw.reloadData()
                self.startTimer()
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    @objc func onClickSeeAll(_ sender: UIButton) {
        self.isShowAll = !self.isShowAll
        self.collectionVw.reloadSections(IndexSet(integer: 2))
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.home_data?.banner_list?.count ?? 0
        case 1:
            return self.home_data?.category_list?.count ?? 0
        default:
            let count = self.isShowAll ? self.home_data?.store_list?.count ?? 0 : min(9, self.home_data?.store_list?.count ?? 0)
            return count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 2 {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoreHeaderCVCell", for: indexPath) as? StoreHeaderCVCell else {return UICollectionReusableView()}
                header.seeAllBtn.setTitle(self.isShowAll ? "Less" : "Show All", for: .normal)
                header.seeAllBtn.addTarget(self, action: #selector(self.onClickSeeAll(_:)), for: .touchUpInside)
                return header
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCVCell", for: indexPath) as? BannerCVCell else { return UICollectionViewCell()}
            let image = "https://cms.cashaly.com/storage/panel/banner/\(self.home_data?.banner_list?[indexPath.row].image ?? "")"
            cell.contentView.cornerRadius = 8
            cell.bannerImgVw.downloadImage(url: image)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVCell", for: indexPath) as? CategoryCVCell else { return UICollectionViewCell()}
            let data = self.home_data?.category_list?[indexPath.row]
            let image = "https://cms.cashaly.com/storage/panel/cat_subcat/\(data?.category_image ?? "")"
            cell.categoryImgVw.downloadImage(url: image)
            cell.categoryLbl.text = data?.name ?? ""
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCVCell", for: indexPath) as? StoreCVCell else { return UICollectionViewCell()}
            let data = self.home_data?.store_list?[indexPath.row]
            let image = "https://cms.cashaly.com/storage/panel/store/\(data?.logo ?? "")"
            cell.categoryImgVw.downloadImage(url: image)
                if data?.rewarde_unit == "AMOUNT" {
                    cell.categoryLbl.text = "Rs.\(data?.max_rewards ?? 0) Cashback"
                }else {
                    cell.categoryLbl.text = "\(data?.max_rewards ?? 0)% Cashback"
                }
            
            return cell
        }
    }
}

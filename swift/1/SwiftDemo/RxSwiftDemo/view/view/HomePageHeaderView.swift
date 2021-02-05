//
//  HomePageHeaderView.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/12/28.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit
import HandyJSON
import Kingfisher

fileprivate let adIdentifier: String = "ImageCollectionViewCell"

class HomePageHeaderView: UIView {
    
    var adArray = [HomePageTopAdModel]()
    var dic = [String: Any]()
    var scrollCollectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 300 + 100)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDataModel(dModel: HomePageTopModel) {
        if let ads = dModel.ad as NSArray? {
            for adModel in ads {
                self.adArray.append(adModel as! HomePageTopAdModel)
            }
        }
        
        if self.adArray.count == 0 {
            let fm = HomePageTopAdModel()
            fm.pi_img = "http://woda.sld66.cn/resource/attachment/images/19/2020/11/U54KrZ1Ptt5axtR4Y51rRYIT154174.png"
            self.adArray.append(fm)
            
            for i in 1...2 {
                let m = HomePageTopAdModel()
                m.pi_img = "feature_image_0" + String(i)
                self.adArray.append(m)
            }
        }
        
        self.scrollCollectionView?.reloadData()
    }
    
    func setupUI() {
        
        setCollectionView()
        
        setupMenuItem()
    }
    
    func setupMenuItem() {
        let imgArray = ["curriculum","activity","special"]
        let titleArray = ["课程","活动","专题"]
        
        let bgView = UIView(frame: CGRect(x: 0, y: 300, width: kScreenWidth, height: 100))
        self.addSubview(bgView)
        
        let item_w = kScreenWidth / CGFloat(imgArray.count)
        let img_w = proportionWidth * 60
        for i in 0...imgArray.count - 1 {
            let v = UIView(frame: CGRect(x: item_w * CGFloat(i), y: 0, width: item_w, height: 100))
            bgView.addSubview(v)
            v.backgroundColor = .white
            
            let imageView = UIImageView(frame: CGRect(x: (v.width - img_w) / 2, y: 10, width: img_w, height: img_w))
            imageView.image = UIImage(named: imgArray[i])
            v.addSubview(imageView)
            
            let lab = UILabel(frame: CGRect(x: 0, y: imageView.bottom + 5, width: v.width, height: 15))
            v.addSubview(lab)
            lab.text = titleArray[i]
            lab.font = UIFont.systemFont(ofSize: 15)
            lab.textAlignment = .center
            lab.textColor = .darkGray
        }
    }
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth, height: 300)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        scrollCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 300), collectionViewLayout: layout)
        self.addSubview(scrollCollectionView!)
        scrollCollectionView?.delegate = self
        scrollCollectionView?.dataSource = self
        scrollCollectionView?.backgroundColor = .white
        scrollCollectionView?.isPagingEnabled = true
        scrollCollectionView?.showsHorizontalScrollIndicator = false
        
        scrollCollectionView?.register(UINib.init(nibName: adIdentifier, bundle: nil), forCellWithReuseIdentifier: adIdentifier)
    }
}

extension HomePageHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.adArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        let model = self.adArray[indexPath.row]
        if model.pi_img!.hasPrefix("http") {
            cell.imageView.kf.setImage(with: ImageResource(downloadURL: URL(string: model.pi_img!)!))
        } else {
            cell.imageView.image = UIImage(named: model.pi_img!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//
//  ReuseCell.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/12/28.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class ReuseCell: UITableViewCell {
    
    @IBOutlet weak var descLB: UILabel!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var bigImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        descLB.numberOfLines = 0
        titleLB.numberOfLines = 0
        
        setupUI()
        
        setData()
    }
    
    func setData() {
        bigImageView?.kf.setImage(with: ImageResource(downloadURL: URL(string: "http://files.cdn.geju.com/gejubusiness/2018-02-01/e4d560d15e3904729452281c2000000c.jpg")!))
        titleLB.text = "​最全解析区块链的下一个十年：混乱、路径与前景"
        descLB.text = "前言：自从2008年中本聪的比特币白皮书发表，至今区块链已经发展了近十年的时间。但在最近的加密数字货币大热潮中，许多人只知比特币、以太坊，却不了解区块链。"
    }
    
    func setupUI() {
        let cgwidth : CGFloat = 423/239*proportionWidth*60
        
        bigImageView.layer.masksToBounds = true
        bigImageView.layer.cornerRadius = 5 * proportionWidth / 2
        bigImageView.snp.makeConstraints { (m) in
            m.width.equalTo(cgwidth)
            m.height.equalTo(proportionWidth * 60)
            m.top.equalTo(proportionWidth * 10)
            m.left.equalTo(proportionWidth * 10)
        }
        
        titleLB.textColor = .black
        titleLB.font = UIFont(name: "Georgia", size: 15)
        titleLB.snp.makeConstraints { (m) in
            m.width.equalTo(kScreenWidth - cgwidth - 30 * proportionWidth)
            m.height.equalTo(20 * proportionWidth)
            m.top.equalTo(proportionWidth * 10)
            m.left.equalTo(cgwidth + proportionWidth * 20)
        }
        
        descLB.textColor = UIColor.darkGray
        descLB.font = UIFont(name: "Georgia", size: 13)
        descLB.snp.makeConstraints { (m) in
            m.width.equalTo(kScreenWidth-cgwidth-30*proportionWidth)
            m.height.equalTo(40*proportionWidth)
            m.top.equalTo(titleLB.snp.bottom)
            m.left.equalTo(cgwidth+20*proportionWidth)
        }
        descLB.lineBreakMode = NSLineBreakMode.byTruncatingTail
        descLB.numberOfLines = 0
        descLB.sizeToFit()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

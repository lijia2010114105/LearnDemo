//
//  ImageCollectionViewCell.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/12/28.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleToFill;
    }
}

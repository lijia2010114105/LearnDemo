//
//  VideoListModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON

class VideoListModel: HandyJSON {
    var summary : String?
    
    var content : String?
    
    var id : String?
    
    var title : String?
    
    var count : String?
    
    var link : String?
    
    var duration : String?
    
    var path : String?
    
    var pics : String?
    
    required init() {
        
    }
}

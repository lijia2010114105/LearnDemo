//
//  CourseListModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON

class CourseListModel: HandyJSON {
    var goods_name : String?
    
    var goodsid : String?
    
    var goods_summary : String?
    
    var goods_start : String?
    
    var goods_end : String?
    
    var goods_img : String?
    
    required init() {
        
    }
}

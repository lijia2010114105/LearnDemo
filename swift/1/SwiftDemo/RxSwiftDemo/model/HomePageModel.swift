//
//  HomePageModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON

class HomePageModel: HandyJSON {
    var title: String?
    var itemType: String?
    var item: NSArray = []
    
    required init() {
        
    }
}

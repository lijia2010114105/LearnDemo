//
//  HomePageTopModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON

class HomePageTopModel: HandyJSON {
    var Item: [HomePageTopItemModel]?
    var ad: [HomePageTopAdModel]?
    var prophet: [HomePageTopProphetModel]?
    
    required init() {
        
    }
}

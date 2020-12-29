//
//  ProjectListModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON

class ProjectListModel: HandyJSON {
    var id : String?
    
    var title : String?
    
    var img : String?
    
    var summary : String?
    
    required init() {
        
    }
}

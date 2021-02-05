//
//  HomePageViewModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/25.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import HandyJSON
import Alamofire

class HomePageViewModel: NSObject {
    var groupingArray = [HomePageModel]()
    var homePageHeaderDic: HomePageTopModel!
    var topModel: HomePageTopModel!
    
    func loadHomePageData(completeBlock: @escaping() -> () ) {
        let url: String = URL_main + GET_HOME_INTERFACE
        print(url)
        
        QMNetworkRequest.requestData(.get, URLString: url, parameters: nil) { (dict) in
            let code = dict["code"] as! Int
            if code == 200 {
                let result = dict["result"] as! NSDictionary

                if let hd = HomePageTopModel.deserialize(from: result["top"] as? NSDictionary) {
                    self.topModel = hd
                }
                completeBlock()
            }
        } failure: { (error) in
            print("error: \(error)")
        }
        
        
    }
}



class Component: HandyJSON {
    var aInt: Int?
    var aString: String?
 
    required init() {}
}
 
class Composition: HandyJSON {
    var aInt: Int?
    var comp1: Component?
    var comp2: Component?
 
    required init() {}
}

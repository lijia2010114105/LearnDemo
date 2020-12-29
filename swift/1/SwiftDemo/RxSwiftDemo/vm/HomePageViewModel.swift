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
    var headerDic: NSDictionary!
    
    func loadHomePageData(completeBlock: @escaping() -> () ) {
        let url: String = URL_main + GET_HOME_INTERFACE
        print(url)
        
        QMNetworkRequest.requestData(.get, URLString: url) { (dict) in
            let code = dict["code"] as! Int
            if code == 200 {
                let result = dict["result"] as! NSDictionary
                self.headerDic = result["top"] as? NSDictionary
                let middleArray = result["middle"] as! NSArray
                
//                if let hd = HomePageTopModel.deserialize(from: result["top"] as! NSDictionary) {
//                    print("---%@",hd.ad);
//                }
                completeBlock()
            }
        }
    }
}

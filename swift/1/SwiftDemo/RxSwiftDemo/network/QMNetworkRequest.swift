//
//  QMNetworkRequest.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/24.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON

typealias SuccessBlock = ([String: Any]) -> Void
typealias FailureBlcok = (AnyObject) -> Void
typealias ProgressBlock = (Float) -> Void

enum MethodType {
    case get
    case post
}

class QMNetworkRequest {
    class func requestData(_ type: MethodType, URLString: String, parameters: [String: Any]? = nil, finishedCallback: @escaping SuccessBlock) -> () {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        AF.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            switch response.result {
                case let .success(result):
                    do {
                        let resultDic: [String: Any] = result as! [String: Any]
                        finishedCallback(resultDic)
                    }
                case let .failure(error):
                    print(error)
            }
        }
    }
}
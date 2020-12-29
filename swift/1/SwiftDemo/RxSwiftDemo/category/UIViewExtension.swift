//
//  UIViewExtension.swift
//  HuaweiShop
//
//  Created by harsons on 2020/9/17.
//  Copyright © 2020 harson. All rights reserved.
//

import UIKit

extension UIView {
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame :CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame :CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame :CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
    }
}

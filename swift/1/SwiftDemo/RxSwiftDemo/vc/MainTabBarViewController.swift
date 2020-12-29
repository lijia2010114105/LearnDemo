//
//  MainTabBarViewController.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/24.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.green]
        let attrs_Select = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Select, for: .selected)
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainTabBarViewController {
    fileprivate func setupUI() {
        let vcs = [HomePageViewController(), AddressBookViewController(), PersonalCenterViewController()]
        let titleArray = [("首页", "essence"), ("关注", "friendTrends"), ("我的", "me")]
        
        for (index, vc) in vcs.enumerated() {
            vc.title = titleArray[index].0
            vc.tabBarItem.title = titleArray[index].0
            vc.tabBarItem.image = UIImage(named: "tabBar_\(titleArray[index].1)_icon")
            vc.tabBarItem.selectedImage = UIImage(named: "tabBar_\(titleArray[index].1)_click_icon")
            
            let nav = UINavigationController(rootViewController: vc)
            addChild(nav)
        }
    }
}


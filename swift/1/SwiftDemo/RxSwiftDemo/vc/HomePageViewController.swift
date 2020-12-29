//
//  HomePageViewController.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/24.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit
import ESPullToRefresh

fileprivate let reuseCellIdentifier: String = "ReuseCell"

class HomePageViewController: UIViewController {
    
    var homePageViewModel = HomePageViewModel()
    var tableView: UITableView?
    let headerView = HomePageHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomePageViewController {
    func setupUI() {
        navigationItem.title = "格局商学"
        
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
        
        tableView?.register(UINib.init(nibName: reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: reuseCellIdentifier)
        
        tableView?.tableHeaderView = headerView
        
        tableView?.es.addPullToRefresh {
            [unowned self] in
            
            print("pull refresh")
            self.tableView?.es.stopPullToRefresh()
            self.tableView?.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
    }
    
    func loadData() {
        homePageViewModel.loadHomePageData {
            self.headerView.setDicData(d: self.homePageViewModel.headerDic)
        }
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  104
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier, for: indexPath)
        
        return cell
    }
}

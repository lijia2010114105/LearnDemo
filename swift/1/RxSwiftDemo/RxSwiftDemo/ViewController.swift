//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/24.
//  Copyright © 2020 harsons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
    
    deinit {
        print("\(Self.self)  \(#function) ____#")
    }
}

extension ViewController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 44
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        return cell
    }
}

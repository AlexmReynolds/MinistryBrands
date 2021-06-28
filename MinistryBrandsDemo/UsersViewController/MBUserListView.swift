//
//  MBUserListView.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBUserListView : UIView {
    
    let tableView : UITableView = {
        let tv = UITableView()
        tv.backgroundColor = MBAppSettings.shared.viewBackgroundColor()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let spinner : UIActivityIndicatorView = {
        let spiner = UIActivityIndicatorView(style: .large)
        spiner.translatesAutoresizingMaskIntoConstraints = false
        spiner.hidesWhenStopped = true
        return spiner
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = MBAppSettings.shared.viewBackgroundColor()
        self.addSubview(self.tableView)
        self.addSubview(self.spinner)
        
        self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive =  true
        self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive =  true

        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.register(MBUserTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

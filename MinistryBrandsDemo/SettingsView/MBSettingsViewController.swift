//
//  MBSettingsViewController.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBSettingsViewController: UIViewController {

    var viewModel :MBSettingsViewModel
    
    init(viewModel: MBSettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.titleString

    }
    override func loadView() {
        let view = MBSettingsView()
        view.tableView.dataSource = self.viewModel.tableDataSource
        view.tableView.delegate = self
        self.view = view
    }
}

extension MBSettingsViewController : UITableViewDelegate {
    
}

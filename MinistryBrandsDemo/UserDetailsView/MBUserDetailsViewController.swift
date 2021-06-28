//
//  MBUserDetailsViewController.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBUserDetailsViewController: UIViewController {
    var viewModel : MBUserDetailsViewModel
    
    init(viewModel: MBUserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.titleString()
        
        if (self.viewModel.isCurrentUser) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Settings", comment: "settings title"), style: .plain, target: self, action: #selector(self.settingsTapped))
        }
    }
    
    override func loadView() {
        let view = MBUserDetailsView()
        view.nameLabel.text = self.viewModel.nameString()
        view.ageLabel.text = self.viewModel.ageString()
        view.addressLabel.text = self.viewModel.addressString()
        self.view = view
    }
    
    @objc func settingsTapped() {
        let viewModel = MBSettingsViewModel(user:self.viewModel.user)
        let vc = MBSettingsViewController(viewModel:viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

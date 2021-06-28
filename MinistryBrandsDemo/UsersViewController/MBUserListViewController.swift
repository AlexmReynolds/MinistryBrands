//
//  MBUserListViewController.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBUserListViewController: UIViewController {

    var viewModel : MBUserListViewModel
    
    init(viewModel:MBUserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.titleString
        
        self.viewModel.modelDidUpdate = {
            DispatchQueue.main.async {
                if let cast = self.view as? MBUserListView {
                    cast.spinner.stopAnimating()
                    cast.tableView.reloadData()
                }
            }
        }
        self.viewModel.loadUsers()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(self.profileTapped))
    }
    
    override func loadView() {
        let view = MBUserListView()
        view.tableView.dataSource = self.viewModel.tableDataSource
        view.tableView.delegate = self
        view.spinner.startAnimating()

        self.view = view
    }
    
    @objc func profileTapped() {
        
        let viewModel = MBUserDetailsViewModel(user: self.viewModel.currentUser, isCurrentUser: true)
        let vc = MBUserDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//Can always abstract to separate class
extension MBUserListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //go to view
        defer {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
        if (self.viewModel.users.count <= indexPath.row) {
            return
        }
        let user = self.viewModel.users[indexPath.row]
        
        let viewModel = MBUserDetailsViewModel(user: user)
        let vc = MBUserDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

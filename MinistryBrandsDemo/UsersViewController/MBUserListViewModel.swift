//
//  MBUserListViewModel.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit
class MBUserListViewModel {
    var currentUser : MBUser
    var tableDataSource = MBUserListViewTableDataSource()
    var users : [MBUser] = []
    var titleString = NSLocalizedString("Users", comment: "users title")
    
    var modelDidErrorBlock : ((Error)->Void)? = nil
    var modelDidUpdate : (()->Void)? = nil
    
    init(currentUser:MBUser) {
        self.currentUser = currentUser
    }
    
    func loadUsers() {
        MBApi.shared.getUsers { result in
            switch result {
            case .success(let users):
                self.users = users
                self.tableDataSource.users = users
                self.modelDidUpdate?()
            case .failure(let error):
                self.modelDidErrorBlock?(error)
                print("user fetch error")
            }
        }
    }
}


class MBUserListViewTableDataSource : NSObject, UITableViewDataSource {
    var users : [MBUser] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if (self.users.count > indexPath.row) {
            let user = self.users[indexPath.row]
            if let cast = cell as? MBUserTableViewCell{
                cast.load(user:user)
            }
        }
        return cell
    }
    
    
}

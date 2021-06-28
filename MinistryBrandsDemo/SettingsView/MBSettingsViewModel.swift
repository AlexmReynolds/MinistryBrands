//
//  MBSettingsViewModel.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBSettingsViewModel {
    var user: MBUser
    var tableDataSource : MBSettingsViewTableDataSource

    var titleString = NSLocalizedString("Settings", comment: "settings")
    init(user:MBUser) {
        self.user = user
        self.tableDataSource = MBSettingsViewTableDataSource(user: user)
    }
}

class MBSettingsViewTableDataSource :NSObject, UITableViewDataSource {
    var user: MBUser
    init(user: MBUser) {
        self.user = user
        super.init()
    }
    enum Rows : Int {
        case awesomeMode = 0
        
    }
    var rows = [Rows.awesomeMode]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cast = cell as? MBSettingsToggleCell, self.rows.count > indexPath.row {
            let row = self.rows[indexPath.row]
            if (row == .awesomeMode) {
                cast.titleLabel.text = NSLocalizedString("Enable Awesome Mode", comment: "Awesome mode title")
                cast.toggle.isOn = self.user.settings?.isAwesomeModeEnabled ?? false
            }
        }
        
        return cell
    }
    
    
}

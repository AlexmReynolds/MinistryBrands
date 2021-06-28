//
//  MBUserDetailsViewModel.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import Foundation
import Contacts
class MBUserDetailsViewModel {
    
    let user : MBUser
    let isCurrentUser : Bool
    init(user: MBUser, isCurrentUser: Bool = false) {
        self.isCurrentUser = isCurrentUser
        self.user = user
    }
    
    func nameString() -> String {
        return "\(self.user.firstName) \(self.user.lastName)"
    }
    func ageString() -> String {
        return "\(self.user.age) year old"
    }
    func addressString() ->String {
        let address = CNMutablePostalAddress()
        address.street = self.user.street
        address.state = self.user.state
        address.city = self.user.city
        address.postalCode = self.user.postCode
        
        
        let formatter = CNPostalAddressFormatter()
        return formatter.string(from: address)
    }
    
    func titleString() -> String {
        var titleString = NSLocalizedString("User", comment: "user details title")
        if (self.isCurrentUser) {
            titleString = NSLocalizedString("Profile", comment: "profile title")
        }
        return titleString
    }
}

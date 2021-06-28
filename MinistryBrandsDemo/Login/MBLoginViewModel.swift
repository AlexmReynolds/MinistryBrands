//
//  MBLoginViewModel.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import Foundation
class MBLoginViewModel {
    var loginDidErrorBlock : ((Error)->Void)? = nil
    var loginDidSucceed : ((MBUser)->Void)? = nil

    func loginUser(username: String, password:String) -> Void {
        MBApi.shared.login(username: username, password: password) { result in
            switch result {
            case .failure(let error):
                self.loginDidErrorBlock?(error)
            case .success(let user):
                self.loginDidSucceed?(user)
            }
        }
    }
}

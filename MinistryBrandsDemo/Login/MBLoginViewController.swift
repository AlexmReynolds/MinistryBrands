//
//  MBLoginViewController.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBLoginViewController: UIViewController {

    var viewModel : MBLoginViewModel = MBLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModelCalls()


    }
    
    func setupViewModelCalls() {
        self.viewModel.loginDidErrorBlock = { error in
            DispatchQueue.main.async {
                self.showError(message: error.localizedDescription)
            }
        }
        self.viewModel.loginDidSucceed = { user in
            DispatchQueue.main.async {
                let model = MBUserListViewModel(currentUser:user)
                let listView = MBUserListViewController(viewModel: model)
                let nav = UINavigationController(rootViewController: listView)
                if let window = self.view.window {
                    window.rootViewController = nav
                }
                
            }

        }
    }
    
    override func loadView() {
        let view = MBLoginView()
        self.view = view
        view.submitButton.addTarget(self, action: #selector(self.submitPressed), for: .touchUpInside)
    }
    
    @objc func submitPressed() {
        if let cast = self.view as? MBLoginView {
            if let username = cast.usernameField.text, username.count > 0, let password = cast.passwordField.text, password.count > 0 {
                cast.submitButton.showLoading()
                self.viewModel.loginUser(username: username, password: password)

            } else {
                if (cast.usernameField.text == nil ||  cast.usernameField.text?.count == 0) {
                    self.showError(message: NSLocalizedString("Username cannot be empty", comment: "username empty error"))
                    return
                }
                
                if (cast.passwordField.text == nil ||  cast.passwordField.text?.count == 0) {
                    self.showError(message: NSLocalizedString("Password cannot be empty", comment: "password empty error"))
                    return
                }
                
            }
           

        }
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: "error title"), message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "ok button"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

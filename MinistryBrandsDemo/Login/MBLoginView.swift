//
//  MBLoginView.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit
class MBLoginView : UIView {
    
    var titleLabel : UILabel = {
        var label = UILabel()
        label.text = NSLocalizedString("Log In", comment: "log in title")
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    var usernameField : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = NSLocalizedString("username", comment: "username")
        field.borderStyle = .roundedRect
        return field
    }()
    
    var passwordField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = NSLocalizedString("password", comment: "password")
        return field
    }()
    
    var submitButton : MBLoadingButton = {
        let button = MBLoadingButton()
        button.backgroundColor = UIColor.blue
        button.setTitle(NSLocalizedString("Log in", comment: "log in"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.titleLabel)
        self.addSubview(self.usernameField)
        self.addSubview(self.passwordField)
        self.addSubview(self.submitButton)
        self.backgroundColor = MBAppSettings.shared.viewBackgroundColor()
        
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64.0).isActive = true

        
        self.usernameField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.usernameField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        self.usernameField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 32.0).isActive = true
        self.usernameField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: -16.0).isActive = true
        
        self.passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        
        self.submitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        self.submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16.0).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MBLoadingButton : UIButton {
    var spinner = UIActivityIndicatorView(style: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.spinner)
        self.spinner.color = UIColor.white
        self.spinner.hidesWhenStopped = true
        self.spinner.translatesAutoresizingMaskIntoConstraints = false
        self.spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoading() {
        self.spinner.startAnimating()
        self.titleLabel?.alpha = 0.0
        self.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        self.spinner.stopAnimating()
        self.titleLabel?.alpha = 1.0
        self.isUserInteractionEnabled = true
    }
}

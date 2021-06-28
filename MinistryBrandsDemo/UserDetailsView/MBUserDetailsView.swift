//
//  MBUserDetailsView.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit

class MBUserDetailsView : UIView {
    
    var nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    var ageLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(white: 0.65, alpha: 1.0)
        return label
    }()
    
    var addressLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(white: 0.65, alpha: 1.0)
        return label
    }()
    
    lazy var avatarWrapper : UIView = {
        let wrapper = UIView()
        wrapper.addSubview(self.avatarImageView)
        self.avatarImageView.topAnchor.constraint(equalTo: wrapper.topAnchor).isActive = true
        self.avatarImageView.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor).isActive = true
        self.avatarImageView.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor).isActive = true
        self.avatarImageView.leadingAnchor.constraint(greaterThanOrEqualTo: wrapper.leadingAnchor).isActive = true
        self.avatarImageView.trailingAnchor.constraint(lessThanOrEqualTo: wrapper.trailingAnchor).isActive = true

        return wrapper
    }()
    
    var avatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.cornerRadius = 60.0
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    //TODO: This should be in a scrollview since we know the data will get longer in production and devices can be smaller
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8.0
        stack.addArrangedSubview(self.avatarWrapper)
        stack.addArrangedSubview(self.nameLabel)
        stack.addArrangedSubview(self.ageLabel)
        stack.addArrangedSubview(self.addressLabel)

        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.stackView)
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0).isActive = true
        self.stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -12.0).isActive = true

        self.backgroundColor = MBAppSettings.shared.viewBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

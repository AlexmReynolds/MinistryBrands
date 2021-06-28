//
//  MBUserTableViewCell.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit
import Contacts
class MBUserTableViewCell : UITableViewCell {
    
    var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
    var addressLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor(white: 0.65, alpha: 1.0)
        label.numberOfLines = 0
        return label
    }()
    
    var avatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.cornerRadius = 30.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")

        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.addressLabel)
        self.contentView.addSubview(self.avatarImageView)
        
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        self.avatarImageView.trailingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: -16).isActive = true
        self.avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        self.avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -16).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        self.addressLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 6).isActive = true
        self.addressLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor, constant: 0).isActive = true
        self.addressLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        self.addressLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -16).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(user:MBUser) {
        self.nameLabel.text = "\(user.firstName) \(user.lastName)"
        
        
        let address = CNMutablePostalAddress()
        address.street = user.street
        address.state = user.state
        address.city = user.city
        address.postalCode = user.postCode
        
        //Might be expensive and should be central or a singleton
        let formatter = CNPostalAddressFormatter()
        self.addressLabel.text = formatter.string(from: address)
    }
}

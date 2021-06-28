//
//  MBUser.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import Foundation
class MBUser {
    var firstName = ""
    var lastName = ""
    var age = 0
    var street = ""
    var city = ""
    var state = ""
    var postCode = ""
    var settings : MBUserSettings? = nil
    init(firstName:String, lastName:String, age:Int, street:String, city:String, state:String, postCode:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.street = street
        self.city = city
        self.state = state
        self.postCode = postCode
    }
    
    class func convert(webObject: MBUserWebObject) -> MBUser {
        return MBUser(firstName: webObject.first_name ?? "", lastName: webObject.last_name ?? "", age: Int(webObject.age ?? "") ?? 0, street: webObject.street ?? "", city: webObject.city ?? "", state: webObject.state ?? "", postCode: webObject.post_code ?? "")
    }
}

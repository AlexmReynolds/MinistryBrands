//
//  MBUserWebObject.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import Foundation

struct MBUserWebObjectResponse : Codable {
    let users : [MBUserWebObject]?
}
struct MBUserWebObject : Codable {
    let first_name : String?
    let last_name : String?
    let age : String?
    let street : String?
    let city : String?
    let state : String?
    let post_code : String?
    
}

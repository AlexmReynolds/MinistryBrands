//
//  MBTheme.swift
//  MinistryBrandsDemo
//
//  Created by Alex Reynolds on 6/26/21.
//

import UIKit
class MBAppSettings {
    static let shared = MBAppSettings()
    
    func loadSettings() {
        //do stuff
    }
    
    func viewBackgroundColor() -> UIColor {
        return UIColor(white: 0.96, alpha: 1.0)
    }
}

//
//  settingsData.swift
//  Spectrocarer
//
//  Created by Renuka on 03/10/19.
//  Copyright © 2019 Vedas. All rights reserved.
//

import Foundation
import  UIKit
class SettingsData: NSObject {
    class func settingsList() -> [[String: String]] {
        var settingsListObj = [[String: String]]()
        
        if UserDefaults.standard.bool(forKey: "isLogedIn") == false {
            settingsListObj.append(contentsOf: [["settingNames": "Terms of Use", "settingImages": "terms_1"],
                                                ["settingNames": "Privacy Policy", "settingImages": "terms_1"],["settingNames": "Contact Us", "settingImages": "call"],["settingNames": "Tech Support", "settingImages": "support"]])
        } else {
        settingsListObj.append(contentsOf: [
                                            ["settingNames": "Profile", "settingImages": "profile"],
                                            ["settingNames": "Notifications", "settingImages": "notification_1"],
                                            ["settingNames": "Terms of Use", "settingImages": "terms_1"],
                                            ["settingNames": "Privacy Policy", "settingImages": "terms_1"],["settingNames": "Contact Us", "settingImages": "call"],["settingNames": "Tech Support", "settingImages": "support"],["settingNames": "Update Password", "settingImages": "lock_1"],["settingNames": "Sign Out", "settingImages": "signout_1"]])
        }
        
        return settingsListObj
    }
}
struct SettingsNames {
    var settingsName: String!
    var settingsImage: String!
    init(attributes: [String: String]) {
        self.settingsName = attributes["settingNames"]
        self.settingsImage = attributes["settingImages"]
    }
}

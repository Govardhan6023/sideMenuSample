//
//  sideMenuProtocols.swift
//  Spectrocarer
//
//  Created by Renuka on 01/10/19.
//  Copyright © 2019 Vedas. All rights reserved.
//

import Foundation
import UIKit
protocol SideMenuViewToPresenterProtocol: class {
    var view: SideMenuPresenterToViewProtocol? {get set}
    var interector: SideMenuPresentorToInterectorProtocol? {get set}
    var router: Router? {get set}
 
    func showSettingsSelection(with settings: [SettingsNames])
    func moveToProfileView()
    func moveToUpdatePAsswordView()
    func moveToLogin()
    func moveToPopToRootView()
    func moveToNotificationsView()
    func moveToTermsAndConditionsView()
    func moveToContactView()
}
protocol SideMenuPresentorToInterectorProtocol: class {
    var presenter: SideMenuInterectorToPresenterProtocol? {get set}
}

protocol SideMenuInterectorToPresenterProtocol: class {
   func settingsListDidFetch(settingsList: [SettingsNames])
}

protocol SideMenuPresenterToViewProtocol: class {
    
}

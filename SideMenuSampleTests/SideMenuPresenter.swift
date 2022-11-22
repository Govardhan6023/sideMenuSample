//
//  SideMenuPresenter.swift
//  Spectrocarer
//
//  Created by Renuka on 01/10/19.
//  Copyright © 2019 Vedas. All rights reserved.
//

import Foundation
import UIKit
class SideMenuPresenter: SideMenuViewToPresenterProtocol {
    
    
    var view: SideMenuPresenterToViewProtocol?
    var interector: SideMenuPresentorToInterectorProtocol?
    var router: Router?
    var settingsList = [SettingsNames]()
    //var storyBoard = UIStoryboard()
    
    func showSettingsSelection(with settings: [SettingsNames]) {
        
    }
        
    func moveToProfileView() {
        router?.navigateToProfileView()
    }
    
    func moveToUpdatePAsswordView() {
        router?.navigateToUpdatePAsswordView()
    }

    func moveToLogin() {
        router?.navigateToLogin()

    }
    
    func moveToPopToRootView() {
        router?.navigateBack()
    }
    
    func moveToNotificationsView(){
        router?.navigateToNotifications()
    }

    func moveToTermsAndConditionsView() {
        router?.navigateToTermsAndConditionsView()
    }

    func moveToContactView(){
        router?.navigateToGeneral()
    }
    
}

extension SideMenuPresenter: SideMenuInterectorToPresenterProtocol {
    func settingsListDidFetch(settingsList: [SettingsNames]) {
        
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

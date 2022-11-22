//
//  sideMenuInteractor.swift
//  Spectrocarer
//
//  Created by Renuka on 01/10/19.
//  Copyright © 2019 Vedas. All rights reserved.
//

import Foundation
class SideMenuInteractor: SideMenuPresentorToInterectorProtocol {
    weak var presenter: SideMenuInterectorToPresenterProtocol?
    func getEmployeeList() {
        presenter?.settingsListDidFetch(settingsList: getAllEmployeeDetail())
    }
    func getAllEmployeeDetail() -> [SettingsNames] {
        var employeeList = [SettingsNames]()
        let allEmployeeDetail = SettingsData.settingsList()
        for item in allEmployeeDetail {
            employeeList.append(SettingsNames(attributes: item))
        }
        return employeeList
    }
}

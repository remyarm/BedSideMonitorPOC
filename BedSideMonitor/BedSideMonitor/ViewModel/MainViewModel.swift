//
//  MainViewModel.swift
//  BedSideMonitor
//
//  Created by apple on 04/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

enum MenuTypes: String, CaseIterable {
    case none = "none"
    case ECG = "ECG"
    case Device1 = "Device1"
    
    func allMenuTypes() -> [String] {
        var values = [String]()
        for menu in MenuTypes.allCases {
            values.append(menu.rawValue)
        }
        return values
    }
}

class MainViewModel: ObservableObject {
    @Published var currentMenu = MenuTypes.none
    @Published var menuToggle = false
}


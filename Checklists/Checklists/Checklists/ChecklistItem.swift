//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Valiant on 2020/4/13.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text: String
    var checked: Bool
    
    override init() {
        checked = false
        text = "New Item"
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
}

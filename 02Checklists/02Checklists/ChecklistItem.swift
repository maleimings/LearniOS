//
//  ChecklistItem.swift
//  02Checklists
//
//  Created by Valiant on 2020/4/26.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name:String
    var isChecked: Bool = false
}

//
//  Checklist.swift
//  Checklists
//
//  Created by Valiant on 2020/4/20.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

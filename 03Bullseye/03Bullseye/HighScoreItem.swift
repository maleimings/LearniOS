//
//  HighScoreItem.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/2.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class HighScoreItem: NSObject, Codable {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

//
//  PersistencyHelper.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/2.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class PersistencyHelper {
    static func saveHighScores(_ items: [HighScoreItem]) {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("error encode \(error.localizedDescription)")
        }
    }
    
    static func loadHighScores() -> [HighScoreItem] {
        var items = [HighScoreItem]()
        
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([HighScoreItem].self, from: data)
            } catch {
                print("decoder error \(error.localizedDescription)")
            }
        }
        return items
    }
    
    static func dataFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0].appendingPathComponent("HighScores.plist")
    }
}

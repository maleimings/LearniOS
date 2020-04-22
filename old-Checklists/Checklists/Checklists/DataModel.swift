//
//  DataModel.swift
//  Checklists
//
//  Created by Valiant on 2020/4/22.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklist()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        var url = documentsDirectory()
        url.appendPathComponent("Checklists.plist")
        return url
    }
    
    func saveChecklists() {
        let endorder = PropertyListEncoder()
        
        do {
            let data = try endorder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding list array:\(error.localizedDescription)")
        }
    }
    
    func loadChecklist() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding list array:\(error.localizedDescription)")
            }
        }
    }
    
}

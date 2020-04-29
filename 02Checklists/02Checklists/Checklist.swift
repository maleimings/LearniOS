//
//  Checklist.swift
//  02Checklists
//
//  Created by Valiant on 2020/4/26.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {
    @Published var items: [ChecklistItem] = []
    
    init() {
        loadListItems()
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
    }
    
    func printChecklistContents() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListitem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printChecklistContents()
        saveListItems()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
        saveListItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveListItems() {
        let encode = PropertyListEncoder()
        
        do {
            let data = try encode.encode(items)
            
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                print("Error : \(error.localizedDescription)")
            }
        }
    }
}

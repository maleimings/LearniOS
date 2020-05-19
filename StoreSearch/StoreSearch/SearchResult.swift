//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Valiant on 2020/5/19.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation

class SearchResult {
    var name = ""
    var artistName = ""
    
    init() {
        
    }
    
    init(name: String, artistName: String) {
        self.name = name
        self.artistName = artistName
    }
}

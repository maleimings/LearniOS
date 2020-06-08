//
//  Search.swift
//  StoreSearch
//
//  Created by Valiant on 2020/6/8.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation


class Search {
    typealias SearchComplete = (Bool) -> Void
    
    var searchResults: [SearchResult] = []
    var hasSearched = false
    var isLoading = false
    
    var dataTask : URLSessionDataTask? = nil
    
    func preformSearch(for text: String, category: Category, completion: @escaping SearchComplete) {
        print("searching...")
        if !text.isEmpty {
            dataTask?.cancel()
            
            isLoading = true
            hasSearched = true
            searchResults = []
            
            let url = iTunesURL(searchText: text, category: category)
            
            let session = URLSession.shared
            dataTask = session.dataTask(with: url, completionHandler: {
                data, response, error in
                var success = false
                if let error = error as NSError?, error.code == -999 {
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200, let data = data {
                    self.searchResults = self.parse(data: data)
                    self.searchResults.sort(by: <)
                    
                    print("success")
                    self.isLoading = false
                    success = true
                }
                
                if !success {
                    self.hasSearched = false
                    self.isLoading = false
                }
                
                DispatchQueue.main.async {
                    completion(success)
                }
            })
            dataTask?.resume()
        }
    }
    
    func iTunesURL(searchText: String, category: Category) -> URL {
        
        let kind = category.type
        
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlUserAllowed)!
        let urlString = "https://itunes.apple.com/search?term=\(encodedText)&limit=200&entity=\(kind)"
        
        return URL(string: urlString)!
    }
    
    func parse(data: Data) -> [SearchResult] {
        do {
            let decoder = JSONDecoder()
            
            let result = try decoder.decode(ResultArray.self, from: data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
    enum Category: Int {
        case all = 0
        case music = 1
        case software = 2
        case ebooks = 3
        
        var type: String {
            switch self {
                case .all: return ""
                case .music: return "musicTrack"
                case .software: return "software"
                case .ebooks: return "ebook"
            }
        }
    }
    
}

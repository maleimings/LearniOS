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
    
    private(set) var state: State = .notSearchedYet
    
    enum State {
        case notSearchedYet
        case loading
        case noResults
        case results([SearchResult])
    }
    
    var dataTask : URLSessionDataTask? = nil
    
    func preformSearch(for text: String, category: Category, completion: @escaping SearchComplete) {
        print("searching...")
        if !text.isEmpty {
            dataTask?.cancel()
            
            state = .loading
            
            let url = iTunesURL(searchText: text, category: category)
            
            let session = URLSession.shared
            dataTask = session.dataTask(with: url, completionHandler: {
                data, response, error in
                var success = false
                var newState = State.notSearchedYet
                
                if let error = error as NSError?, error.code == -999 {
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200, let data = data {
                    var searchResults = self.parse(data: data)
                    if searchResults.isEmpty {
                        newState = .noResults
                    } else {
                        searchResults.sort(by: <)
                        newState = .results(searchResults)
                    }
                    success = true
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

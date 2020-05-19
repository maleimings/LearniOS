//
//  ViewController.swift
//  StoreSearch
//
//  Created by Valiant on 2020/5/19.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [SearchResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right:0)
    }


}


extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        searchResults = []
        
        for i in 0...2 {
            let searchResult = SearchResult(name: String(format: "Fake Result %d for '%@'", i, searchBar.text!), artistName: searchBar.text!)
            searchResults.append(searchResult)
        }
        
        tableView.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension SearchViewController: UITableViewDelegate,
                                UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let searchResult = searchResults[indexPath.row]
        cell.textLabel!.text = searchResult.name
        cell.detailTextLabel!.text = searchResult.artistName
        
        return cell
    }
}

//
//  HighScoresViewController.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/2.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit

class HighScoresViewController: UITableViewController,
                                EditHighScoreViewControllerDelegates {
    
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func editHighScoreViewController(_ controller: EditHighScoreViewController, didFinishEditing item: HighScoreItem) {
        
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            let indexPaths = [indexPath]
            
            tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        PersistencyHelper.saveHighScores(items)
        navigationController?.popViewController(animated: true)
    }
    
    var items = [HighScoreItem]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditHighScoreViewController
        
        controller.delegate = self
        
        if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            controller.highScoreItem = items[indexPath.row]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        items = PersistencyHelper.loadHighScores()
        if items.count == 0 {
            resetHightScores()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        
        let item = items[indexPath.row]
        
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        PersistencyHelper.saveHighScores(items)
    }
    
    @IBAction func resetHightScores() {
        items = [HighScoreItem]()
        initItems()
        tableView.reloadData()
        PersistencyHelper.saveHighScores(items)
    }
    
    private func initItems() {
        items.append(HighScoreItem(name: "The reader of this book", score: 50000))
        items.append(HighScoreItem(name: "Manda", score: 10000))
        items.append(HighScoreItem(name: "Joey", score: 5000))
        items.append(HighScoreItem(name: "Adam", score: 1000))
        items.append(HighScoreItem(name: "Eli", score: 500))
    }

}

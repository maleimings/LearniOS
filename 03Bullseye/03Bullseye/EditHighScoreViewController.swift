//
//  EditHighScoreViewController.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/2.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit


protocol EditHighScoreViewControllerDelegates: class {
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreViewController)
    
    func editHighScoreViewController(_ controller: EditHighScoreViewController,
                                     didFinishEditing item: HighScoreItem)
}

class EditHighScoreViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var testField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: EditHighScoreViewControllerDelegates?
    var highScoreItem: HighScoreItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testField.text = highScoreItem.name
        doneBarButton.isEnabled = !highScoreItem.name.isEmpty
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        testField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let oldText = textField.text!
        
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    @IBAction func cancel() {
        delegate?.editHighScoreViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        highScoreItem.name = testField.text!
        delegate?.editHighScoreViewController(self, didFinishEditing: highScoreItem)
    }

}

//
//  ViewController.swift
//  03Bullseye
//
//  Created by Valiant on 2020/5/1.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startNewRound()
    }

    @IBAction func showAlert() {
        
        let title: String
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        if difference == 0 {
            title = "Perfect"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference < 10 {
            title = "pretty good"
        } else {
            title = "Not even close"
        }
        
        let message = "Your scored \(points) \n"
            + "The value of the slider is: \(currentValue)"
            + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            _ in self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        score += points
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(_ button: UIButton) {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        update()
    }
    
    func update() {
        updateTargetLabel()
        updateScore()
        updateRound()
    }
    
    func updateTargetLabel() {
        targetLabel.text = String(targetValue)
    }
    
    func updateRound() {
        roundLabel.text = String(round)
    }
    
    func updateScore() {
        scoreLabel.text = String(score)
    }

}


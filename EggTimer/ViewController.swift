//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    convert mins to secs
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    
    var totalTime = 0
    var secondPasses = 0
    
    @IBAction func hardneddSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondPasses = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    
    }

    @objc func updateCounter() {
        //example functionality
        if secondPasses < totalTime {
            print("\(totalTime-secondPasses) seconds.")
            
            secondPasses += 1
//            let pctProgress  = Float(secondPasses) / Float(totalTime)
            progressBar.progress = Float(secondPasses) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
        }
    }

}



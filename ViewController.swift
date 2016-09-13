//
//  ViewController.swift
//  BullsEye
//
//  Created by skoty on 17/08/16.
//  Copyright © 2016 skoty. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    
        var currentValue = 0
        var targetValue = 0
        var score = 0
        var round = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAllert() {
        
        let  diffrence = abs(currentValue - targetValue)
        
        var points = 100 - diffrence
        
        round++
        
        
        let title: String
        
        if diffrence == 0{
            title = "Awesome!!!"
            points+=100
        } else if diffrence < 5 {
            title = "Almost had it!!"
            if diffrence==1{
                points+=50
            }
        } else if diffrence < 10 {
            title = "Not bad!"
        } else {
            title = "Not even close..."
        }
        
        score=score+points
        
        let message = "You scored \(points) points"
      
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                                                                            self.startNewRound()
                                                                            self.updateLabels()
            })
        
            alert.addAction(action)
            
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewRound(){
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:
                                                            kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil) }
    
    
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

}


//
//  ViewController.swift
//  proto-counting-animation-ioos
//
//  Created by Santosh Krishnamurthy on 3/16/23.
//

import UIKit

class ViewController: UIViewController {

    // Create
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    var displayLink: CADisplayLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        // create a display link object with a handler
        // It runs the handler each time for each frame in frame rate
        displayLink = CADisplayLink(target: self, selector: #selector(handleDisplay))
        // register the displaylink to a Runloop.
        // This will allow displaylink to notify the target when a new frame is needed
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }
    
    var startValue:Double = 1000
    let endValue: Double = 20000
    let animationDuration: Double = 2
    
    let animationStartDate = Date()
    
    @objc func handleDisplay(){
        // let seconds = Date().timeIntervalSince1970
        // countingLabel.text = "\(seconds)"
        
        // Get current date/time
        let now = Date()
        // calculate time since start of animation
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        // check if animation ran over
        if elapsedTime > animationDuration{
            countingLabel.text = "Done: \(endValue)"
            // self.displayLink.remove(from: RunLoop.main, forMode: RunLoop.Mode.default)
            self.displayLink.invalidate()
        } else {
            // calculate the % of total time elapsed
            let percent = elapsedTime / animationDuration
            // use the % to calculate new value to display
            let value = startValue + percent * (endValue - startValue)
            // print("Percent: \(percent); value: \(value)")
            countingLabel.text = "\(value)"
        }
        

    }


}


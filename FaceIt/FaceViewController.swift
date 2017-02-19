//
//  ViewController.swift
//  FaceIt
//
//  Created by Tan Nguyen on 27/08/16.
//  Copyright © 2016 Tan Nguyen. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController
{
    var expression = FacialExpression(eyes: .closed, eyeBrows: .relaxed, mouth: .smirk) {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.changeScale(_:))
                ))
            let happierSwipeGestureRegonizer = UISwipeGestureRecognizer(target: self, action: #selector(FaceViewController.increaseHappiness))
            
            happierSwipeGestureRegonizer.direction = .up
            faceView.addGestureRecognizer(happierSwipeGestureRegonizer)
            
            let sadderSwipeGestureRegonizer = UISwipeGestureRecognizer(target: self, action: #selector(FaceViewController.decreaseHappiness))
            
            sadderSwipeGestureRegonizer.direction = .down
            faceView.addGestureRecognizer(sadderSwipeGestureRegonizer)
            
            updateUI()
        }
    }
    
    @IBAction func toggleEyes(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended{
            switch expression.eyes{
            case .open: expression.eyes = .closed
            case .closed: expression.eyes = .open
            case .squinting: break
            }
        }
        
    }
    
    func increaseHappiness()
    {
        expression.mouth = expression.mouth.happierMouth()
        
    }
    
    func decreaseHappiness()
    {
        expression.mouth = expression.mouth.sadderMouth()
        
    }
    
    
    fileprivate var mouthCurvatures = [FacialExpression.Mouth.frown: -1.0, .grin: 0.5, .smile: 1.0, .smirk: -0.5, .neutral: 0.0 ]
    
    fileprivate var eyeBrowTilts = [FacialExpression.EyeBrows.relaxed: -0.5, .furrowed: -0.5, .normal: 0.0]
    
    fileprivate func updateUI() {
        if faceView != nil{
            switch expression.eyes {
            case .open: faceView.eyesOpen = true
            case .closed: faceView.eyesOpen = false
            case .squinting: faceView.eyesOpen = false
            }
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
            faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
        }
    }
    
    
    
}


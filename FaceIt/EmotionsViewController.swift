//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Tan Nguyen on 08/09/16.
//  Copyright © 2016 Tan Nguyen. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController
{
    fileprivate let emotionalFaces: Dictionary<String,FacialExpression> = [
        "angry" : FacialExpression(eyes: .closed, eyeBrows: .furrowed, mouth: .frown),
        "happy" : FacialExpression(eyes: .open, eyeBrows: .normal, mouth: .smile),
        "worried" : FacialExpression(eyes: .open, eyeBrows: .relaxed, mouth: .smirk),
        "mischievious" : FacialExpression(eyes: .open, eyeBrows: .furrowed, mouth: .grin)
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationvc = segue.destination
        if let navcon = destinationvc as? UINavigationController{
            destinationvc = navcon.visibleViewController ?? destinationvc
            
        }
        if let facevc = destinationvc as? FaceViewController{
            if let identifier = segue.identifier{
                if let expression = emotionalFaces[identifier]{
                    facevc.expression = expression
                    if let sendingButton = sender as? UIButton{
                        facevc.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
        
    }
    
    
}

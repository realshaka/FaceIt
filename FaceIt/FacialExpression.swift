//
//  FacialExpression.swift
//  FaceIt
//
//  Created by Tan Nguyen on 01/09/16.
//  Copyright © 2016 Tan Nguyen. All rights reserved.
//

import Foundation

struct FacialExpression
{
    enum Eyes: Int{
        case open
        case closed
        case squinting
    }
    
    enum EyeBrows: Int {
        case relaxed
        case normal
        case furrowed
        
        func moreRelaxedBrow() ->  EyeBrows {
            return EyeBrows(rawValue: rawValue - 1) ?? .relaxed
        }
        func moreFurrowedBrow() -> EyeBrows {
            return EyeBrows(rawValue: rawValue + 1) ?? .furrowed
        }
    }
    
    enum Mouth: Int{
        case frown
        case smirk
        case neutral
        case grin
        case smile
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        func happierMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    var eyes: Eyes
    var eyeBrows: EyeBrows
    var mouth: Mouth
        
}

//
//  RPSMatch.swift
//  roshampo-seperateModel
//
//  Created by Geek on 1/10/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation

struct RPSMatch{
    
    let p1: RPS
    let p2: RPS
    let date: Date
    
    init(_ p1: RPS,_ p2: RPS){
        self.p1 = p1
        self.p2 = p2
        self.date = Date()
    }
    
    var winner: RPS{
        get{
//            return p1.defeats(p2) ? p1 : p2
            return p1 > p2 ? p1 : p2
        }
    }
    
    var loser: RPS{
        get{
//            return p1.defeats(p2) ? p2 : p1
            return p1 < p2 ? p1 : p2
        }
    }
}

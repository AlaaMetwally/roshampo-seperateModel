//
//  RPS.swift
//  roshampo-seperateModel
//
//  Created by Geek on 1/10/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
enum RPS:Comparable{
    case rock,paper,scissors
    
    init(){
        switch arc4random()%3{
            case 0:
                self = .rock
            case 1:
                self = .paper
            default:
                self = .scissors
            }
        }
    func defeats(_ opponent: RPS) -> Bool{
        switch(self,opponent){
        case (.paper,.rock),(.scissors,.paper),(.rock,.scissors):
            return true
        default:
            return false
        }
    }
}
func < (lhs: RPS, rhs: RPS) -> Bool {
    switch(lhs,rhs){
    case (.rock,.paper),(.paper,.scissors),(.scissors,.rock):
        return true
    default:
        return false
    }
}
extension RPS: CustomStringConvertible{
    var description: String{
        get{
            switch (self){
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }
}

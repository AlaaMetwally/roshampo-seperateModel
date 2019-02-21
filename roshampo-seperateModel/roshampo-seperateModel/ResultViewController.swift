//
//  ResultViewController.swift
//  roshampo-seperateModel
//
//  Created by Geek on 1/10/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var goBackButton: UIButton!
    
    var match: RPSMatch!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5)
        {
            self.imageResult.alpha = 1;
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.labelResult.text = messageForMatch(match)
        self.imageResult.image = imageForMatch(match)
    }
    @IBAction func playAgain(_ sender: Any) {
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func showHistory(_ sender: Any) {
    }
    
    func messageForMatch(_ match: RPSMatch) -> String{
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    func resultString(_ match: RPSMatch) -> String{
//        return match.p1.defeats(match.p2) ? "You Win" : "You Lose"
        return match.p1 > match.p2 ? "You Win" : "You Lose"
    }
    func victoryModeString(_ match: RPS) -> String{
        switch (match) {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    func imageForMatch(_ match: RPSMatch) -> UIImage{
        var name = ""
        switch (match.winner) {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}

//
//  RockPaperScissorsViewController.swift
//  roshampo-seperateModel
//
//  Created by Geek on 1/10/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var showHistory: UIButton!
    var match: RPSMatch!
    var history = [RPSMatch]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    @IBAction func makeYourMove(_ sender: UIButton){
        switch(sender){
        case self.rockButton:
            throwDown(RPS.rock)
        case self.scissorsButton:
            throwDown(RPS.scissors)
        case self.paperButton:
            throwDown(RPS.paper)
        default:
            assert(false,"An unknown button invokes your makeYouMave()")
        }
    }
    func throwDown(_ playersMove: RPS){
         let computersMove = RPS()
         self.match = RPSMatch(playersMove,computersMove)
         history.append(self.match)
        if (playersMove == RPS.rock) {
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            resultVC.match = self.match
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
        else if(playersMove == RPS.paper){
            performSegue(withIdentifier: "throwDownPaper", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.match = self.match
    }
    @IBAction func showHistory(_ sender: AnyObject){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HistoryViewController")as! HistoryViewController
        controller.history = self.history
        present(controller, animated: true, completion: nil)
    }
}


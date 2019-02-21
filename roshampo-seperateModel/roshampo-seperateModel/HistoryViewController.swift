//
//  HistoryViewController.swift
//  roshampo-seperateModel
//
//  Created by Geek on 1/11/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var history: [RPSMatch]!
    @IBOutlet weak var goBack: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "History")!
        let historyForRow = self.history[(indexPath as NSIndexPath).row]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formatDate = formatter.string(from: historyForRow.date)

        cell.detailTextLabel?.text = "\(historyForRow.p1) vs \(historyForRow.p2)"
        cell.textLabel?.text = victory(historyForRow)        
        return cell
    }
    func victory(_ match: RPSMatch) -> String{
        var result = ""
        switch(true){
        case (match.p1 == match.p2):
            result = "It is a tie"
        case (match.p1.defeats(match.p2)):
            result = "Win"
        default:
            result = "Lose"
        }
        return result
    }
    @IBAction func goBack(_ sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
}


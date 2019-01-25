//
//  ResultViewControler.swift
//  Janken
//
//  Created by Yu Shimura on 2019/01/25.
//  Copyright © 2019 Yu Shimura. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController {
    
    var userHand: String!
    
    var comHand: String!
    
    var resultHandler: ((String) -> Void)?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    
    override func viewDidLoad() {
        self.title = "結果"
//        self.resultLabel.text = "あいこ"
//        self.comImageView.image = UIImage(named: "com-gu")
        comHand = choiceComHand()
        self.comImageView.image = UIImage(named: "com-\(comHand!)")
        
        let result = judgeResult(userHand: userHand, comHand: comHand)
        self.resultLabel.text = result
        // 結果.let result =judgeResult(userHand: userHand, comHand: comHand)     resultLabel.text= result
    }
    
    func choiceComHand() -> String{
        let choices = ["gu", "choki", "pa"]
        let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
        return choices[randomIndex]
    }
    
    func judgeResult(userHand: String, comHand: String) -> String {
        
        if userHand == "gu" {
            if comHand == "gu" {
                return "あいこ"
            } else if comHand == "choki" {
                return "勝ち"
            } else if comHand == "pa" {
                return "負け"
            }
        } else if userHand == "choki" {
            if comHand == "gu" {
                return "負け"
            } else if comHand == "choki" {
                return "あいこ"
            } else if comHand == "pa" {
                return "勝ち"
            }
        } else if userHand == "pa" {
            if comHand == "gu" {
                return "勝ち"
            } else if comHand == "choki" {
                return "負け"
            } else if comHand == "pa" {
                return "あいこ"
            }
        }
        
        return ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let result = judgeResult(userHand: userHand, comHand: comHand)
        
        if let handler = self.resultHandler{
            handler(result)
        }
    }
}

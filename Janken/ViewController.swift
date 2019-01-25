//
//  ViewController.swift
//  Janken
//
//  Created by Yu Shimura on 2019/01/25.
//  Copyright © 2019 Yu Shimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var win :Int = 0
    var lose :Int = 0
    var even :Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var jankenWinConut: UILabel!
    
    
    @IBAction func onTapGu(_ sender: Any) {
//        print("gu")
        self.performSegue(withIdentifier: "result", sender: "gu")
    }
    
    @IBAction func onTapChoki(_ sender: Any) {
//        print("choki")
        self.performSegue(withIdentifier: "result", sender: "choki")
    }
    
    @IBAction func onTapPa(_ sender: Any) {
//        print("pa")
        self.performSegue(withIdentifier: "result", sender: "pa")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController{
            if let hand = sender as? String{
                vc.userHand = hand
            }
            vc.resultHandler = { result in
                if result == "勝ち" {
                    self.win += 1
                } else if result == "負け" {
                    self.lose += 1
                } else {
                    self.even += 1
                }
                self.jankenWinConut.text = "\(self.win)勝\(self.lose)敗\(self.even)分"
            }
        }
        
    }
}


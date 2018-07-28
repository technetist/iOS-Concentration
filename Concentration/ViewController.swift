//
//  ViewController.swift
//  Concentration
//
//  Created by Adrien Maranville on 7/24/18.
//  Copyright © 2018 Adrien Maranville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        didSet {
            lblCardFlips.text = "Flips: \(flipCount)"
        }
    }
    var emojiArray = ["🤪","😇","🤪","😇",
                      "😍","🙃","😍","🙃",
                      "😱","🤯","😱","🤯"]
    @IBOutlet weak var lblCardFlips: UILabel!
    @IBOutlet var btnCollectionCards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = btnCollectionCards.index(of: sender){
                flipCard(withEmoji: emojiArray[cardNumber], on: sender)
        }
    }
    
    
    func flipCard(withEmoji emoji:String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.5882352941, blue: 0.9882352941, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.8075814843, green: 0.9540835023, blue: 0.9217092395, alpha: 1)
        }
    }
}


//
//  ViewController.swift
//  Concentration
//
//  Created by Adrien Maranville on 7/24/18.
//  Copyright © 2018 Adrien Maranville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (btnCollectionCards.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            lblCardFlips.text = "Flips: \(flipCount)"
        }
    }
    var emojiArray = ["🤪","🤬","🤢","😇",
                      "😍","🙃","😈","😖",
                      "😱","🤯","😲","🤕"]
    var emoji = [Int:String]()
    @IBOutlet weak var lblCardFlips: UILabel!
    @IBOutlet var btnCollectionCards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = btnCollectionCards.index(of: sender){
                game.chooseCard(at: cardNumber)
                updateViewFromModel()
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiArray.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiArray.count)))
                emoji[card.identifier] = emojiArray.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in btnCollectionCards.indices {
            let button = btnCollectionCards[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.8075814843, green: 0.9540835023, blue: 0.9217092395, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 0.1176470588, green: 0.5882352941, blue: 0.9882352941, alpha: 1)
            }
        }
    }
}


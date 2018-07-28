//
//  ViewController.swift
//  Concentration
//
//  Created by Adrien Maranville on 7/24/18.
//  Copyright © 2018 Adrien Maranville. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "🤪", on: sender)
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


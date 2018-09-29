//
//  ViewController.swift
//  Concentration
//
//  Created by Shejia Zhu on 9/17/18.
//  Copyright © 2018 Hal Tokyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // lazy: doesn't actually initialize until someone tries to use it
    // lazy: cannot have property observer
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count/2)
    
    var flipCount = 0 {
        // property observer
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        // for button in cardButtons {}
        // indices: all index in ascending order
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃","👻","😈","🤡","💩","🎩"]
    
    var emoji = [Int:String]() // var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0{ //nested if
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?" //exactly the same code as below
        /* if emoji[card.identifier] != nil {
            return emoji[card.identifier]
        }
        else {
            return "?"
        }*/
    }
    
    /* func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }*/
}


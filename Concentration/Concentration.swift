//
//  Concentration.swift
//  Concentration
//
//  Created by Shejia Zhu on 9/20/18.
//  Copyright © 2018 Hal Tokyo. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]() //var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // default init is gonna be  init() {}
    init(numberOfPairsOfCards: Int) {
        // for-loop
        // for i in [sequence], sequence can be Array, String, etc
        // 0...x means range 0~x(including x)
        // 0..<x means range 0~x(not including x)
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // strcut makes a copy not a reference
            // Array is also a struct
            cards += [card, card] //add 2 cards into cards-array, one as a matching card
        }
        // TODO: Shuffle the cards
        for i in 0..<cards.count {
            let j = Int(arc4random_uniform(UInt32(cards.indices.last!)))
            if i != j {
                cards.swapAt(i, j)
            }
        }
        
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        /* if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        else {
            cards[index].isFaceUp = true
        } */
    }
}

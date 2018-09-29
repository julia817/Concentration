//
//  Card.swift
//  Concentration
//
//  Created by Shejia Zhu on 9/20/18.
//  Copyright © 2018 Hal Tokyo. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // default init is gonna be
    // init(isFaceUp:Bool, isMatched:Bool, identifier:Int) {}
    
    /* init(identifier: Int) {
        // init tends to have the same internal&external parameter name
        self.identifier = identifier //self.identifier → instance var
    } */
    
    
    static var identifierFactory = 0
    
    // return a Int
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

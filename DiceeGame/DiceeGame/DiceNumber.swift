//
//  DiceNumber.swift
//  DiceeGame
//
//  Created by Tatiane Silva on 30/08/23.
//

import Foundation

enum DiceNumber: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    
    static func randon() -> DiceNumber {
        return self.allCases.randomElement() ?? .one
    }
}

//
//  Hand.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import Foundation

enum Hand {
    case rock
    case scissors
    case paper
}

extension Hand {
    var text: String {
        switch self {
        case .rock:
            return "グー"
        case .scissors:
            return "チョキ"
        case .paper:
            return "パー"
        }
    }
    
    var emoji: String {
        switch self {
        case .rock:
            return "✊"
        case .scissors:
            return "✌️"
        case .paper:
            return "✋"
        }
    }
}

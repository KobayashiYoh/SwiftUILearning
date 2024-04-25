//
//  Result.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/25.
//

import Foundation

enum Result {
    case draw
    case win
    case lose
}

extension Result {
    var text: String {
        switch self {
        case .draw:
            return "引き分け"
        case .win:
            return "勝ち"
        case .lose:
            return "負け"
        }
    }
}

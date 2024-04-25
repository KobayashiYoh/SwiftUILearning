//
//  State.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/25.
//

import Foundation

final class State: ObservableObject {
    @Published var message = "じゃんけん…"
    @Published var result = Result.draw
    @Published var cpuHand = Hand.rock
    
    func generateCPUHand() -> Hand {
        let hands = [Hand.rock, Hand.scissors, Hand.paper]
        let hand = hands.randomElement()
        return hand!
    }

    func judgeResult(playerHand: Hand, cpuHand: Hand) -> Result {
        let isDraw = playerHand == cpuHand
        let isWin = (playerHand == .rock && playerHand == .scissors) || (playerHand == .scissors && cpuHand == .paper) || (playerHand == .paper && cpuHand == .rock)
        if (isDraw) {
            return .draw
        } else if (isWin) {
            return .win
        } else {
            return .lose
        }
    }
}

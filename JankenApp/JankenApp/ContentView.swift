//
//  ContentView.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "じゃんけん…"
    @State private var result = Result.draw
    @State private var cpuHand = Hand.rock

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

    func onTapHand(hand: Hand) -> Void {
        let playerHand = hand
        cpuHand = generateCPUHand()
        result = judgeResult(playerHand: playerHand, cpuHand: cpuHand)
        message = result.text
    }

    var body: some View {
        VStack {
            Spacer()
            Text(message).font(.title)
            Text("😎" + cpuHand.emoji)
            Spacer()
            HStack {
                Spacer()
                HandButton(onTap: {
                    onTapHand(hand: .rock)
                }, hand: .rock)
                Spacer()
                HandButton(onTap: {
                    onTapHand(hand: .scissors)
                }, hand: .scissors)
                Spacer()
                HandButton(onTap: {
                    onTapHand(hand: .paper)
                }, hand: .paper)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

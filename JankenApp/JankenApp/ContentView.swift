//
//  ContentView.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "じゃんけん…"
    @State private var cpuHand = Hand.rock

    func generateCPUHand() -> Hand {
        let hands = [Hand.rock, Hand.scissors, Hand.paper]
        let hand = hands.randomElement()
        return hand!
    }

    func judgeResultMessage(playerHand: Hand, cpuHand: Hand) -> String {
        let isDraw = playerHand == cpuHand
        let isWin = (playerHand == .rock && playerHand == .scissors) || (playerHand == .scissors && cpuHand == .paper) || (playerHand == .paper && cpuHand == .rock)
        if (isDraw) {
            return "引き分け"
        } else if (isWin) {
            return "勝ち"
        } else {
            return "負け"
        }
    }

    func onTapHand(hand: Hand) -> Void {
        let playerHand = hand
        cpuHand = generateCPUHand()
        message = judgeResultMessage(playerHand: playerHand, cpuHand: cpuHand)
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

//
//  ContentView.swift
//  UnreasonableJankenApp
//
//  Created by 小林陽 on 2023/04/19.
//

import SwiftUI

enum Hand: CaseIterable {
    case rock
    case scissors
    case paper
}

extension Hand {
    func text() -> String {
        switch (self) {
        case Hand.rock:
            return "グー"
        case Hand.scissors:
            return "チョキ"
        case Hand.paper:
            return "パー"
        }
    }
}

enum Result {
    case win
    case lose
    case draw
}

extension Result {
    func text() -> String {
        switch (self) {
        case Result.win:
            return "あなたの勝利！"
        case Result.lose:
            return "あなたの敗北…"
        case Result.draw:
            return "引き分け"
        }
    }
}

struct ContentView: View {
    @State var result = Result.draw
    @State var cpuHand = Hand.rock
    @State var yourHand = Hand.rock
    var body: some View {
        VStack {
            Text(result.text()).font(.title)
            Text("CPU: \(cpuHand.text())")
            Text("あなた: \(yourHand.text())")
            HStack {
                HandButton(
                    action: {onPressedAction(hand: Hand.rock)}
                )
                HandButton(
                    action: {onPressedAction(hand: Hand.scissors)}
                )
                HandButton(
                    action: {onPressedAction(hand: Hand.paper)}
                )
            }
        }
        .padding()
    }
    init() {
        self.yourHand = Hand.paper
    }
    func onPressedAction(hand: Hand) -> Hand {
        self.yourHand = hand
        self.cpuHand = Hand.allCases.randomElement() ?? Hand.rock
        self.result = judgeResult()
        return hand
    }
    func judgeResult() -> Result {
        let isDraw = yourHand == cpuHand
        let isWin = (self.yourHand == Hand.rock && self.cpuHand == Hand.scissors) || (self.yourHand == Hand.scissors && self.cpuHand == Hand.paper) || (self.yourHand == Hand.paper && self.cpuHand == Hand.rock)
        if (isDraw) {
            return Result.draw
        } else if (isWin) {
            return Result.win
        } else {
            return Result.lose
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

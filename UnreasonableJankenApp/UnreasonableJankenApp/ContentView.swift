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
    func labelText() -> String {
        switch (self) {
        case Hand.rock:
            return "グー"
        case Hand.scissors:
            return "チョキ"
        case Hand.paper:
            return "パー"
        }
    }
    func iconText() -> String {
        switch (self) {
        case Hand.rock:
            return "✊"
        case Hand.scissors:
            return "✌️"
        case Hand.paper:
            return "✋"
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
    @State var leftHand = Hand.allCases.randomElement() ?? Hand.rock
    @State var centerHand = Hand.allCases.randomElement() ?? Hand.rock
    @State var rightHand = Hand.allCases.randomElement() ?? Hand.rock
    var body: some View {
        VStack {
            Text(result.text()).font(.title).padding()
            Text("CPU: \(cpuHand.labelText())")
            Text("あなた: \(yourHand.labelText())")
            HStack {
                HandButton(
                    action: {onPressedAction(hand: leftHand)}
                )
                HandButton(
                    action: {onPressedAction(hand: centerHand)}
                )
                HandButton(
                    action: {onPressedAction(hand: rightHand)}
                )
            }.padding()
        }
        .padding()
    }
    func onPressedAction(hand: Hand) -> Hand {
        self.yourHand = hand
        self.cpuHand = Hand.allCases.randomElement() ?? Hand.rock
        self.result = judgeResult(yourHand: self.yourHand, cpuHand: self.cpuHand)
        self.leftHand = Hand.allCases.randomElement() ?? Hand.rock
        self.centerHand = Hand.allCases.randomElement() ?? Hand.rock
        self.rightHand = Hand.allCases.randomElement() ?? Hand.rock
        return hand
    }
    func judgeResult(yourHand: Hand, cpuHand: Hand) -> Result {
        let isDraw = yourHand == cpuHand
        let isWin = (yourHand == Hand.rock && cpuHand == Hand.scissors) || (yourHand == Hand.scissors && cpuHand == Hand.paper) || (yourHand == Hand.paper && cpuHand == Hand.rock)
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

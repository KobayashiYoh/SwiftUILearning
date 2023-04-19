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

struct ContentView: View {
    @State var cpuHand = Hand.rock
    @State var yourHand = Hand.rock
    var body: some View {
        VStack {
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
        return hand
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

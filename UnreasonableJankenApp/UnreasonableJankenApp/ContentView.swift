//
//  ContentView.swift
//  UnreasonableJankenApp
//
//  Created by 小林陽 on 2023/04/19.
//

import SwiftUI

enum Hand {
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
                HandButton(hand: Hand.rock)
                HandButton(hand: Hand.scissors)
                HandButton(hand: Hand.paper)
            }
        }
        .padding()
    }
    init() {
        self.yourHand = Hand.paper
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

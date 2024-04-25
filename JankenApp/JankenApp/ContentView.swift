//
//  ContentView.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = State()

    func onTapHand(hand: Hand) -> Void {
        let playerHand = hand
        state.cpuHand = state.generateCPUHand()
        state.result = state.judgeResult(playerHand: playerHand, cpuHand: state.cpuHand)
        state.message = state.result.text
    }

    var body: some View {
        VStack {
            Spacer()
            Text(state.message).font(.title)
            Text("😎" + state.cpuHand.emoji)
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

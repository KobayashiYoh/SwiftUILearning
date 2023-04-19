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
    var body: some View {
        VStack {
            Text(Hand.paper.text())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

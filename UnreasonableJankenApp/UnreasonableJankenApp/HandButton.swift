//
//  HandButton.swift
//  UnreasonableJankenApp
//
//  Created by 小林陽 on 2023/04/19.
//

import SwiftUI

struct HandButton: View {
    var hand: Hand
    var body: some View {
        Button(action: {}) {
            Text(hand.text())
        }
    }
}

struct HandButton_Previews: PreviewProvider {
    static var previews: some View {
        HandButton(hand: Hand.rock)
    }
}

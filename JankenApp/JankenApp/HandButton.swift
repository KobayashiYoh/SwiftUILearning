//
//  HandButton.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import SwiftUI

struct HandButton: View {
    let onTap: () -> Void
    let hand: Hand

    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            VStack {
                Text(hand.emoji).font(.title)
                Text(hand.text).font(.title)
            }
        })
    }
}

struct HandButton_Previews: PreviewProvider {
    static var previews: some View {
        HandButton(onTap: {
            print("Rock button tapped")
        } ,hand: .rock)
    }
}

//
//  ContentView.swift
//  JankenApp
//
//  Created by 小林陽 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Spacer()
            HandButton(onTap: {
                print(Hand.rock.text)
            }, hand: .rock)
            Spacer()
            HandButton(onTap: {
                print(Hand.paper.text)
            }, hand: .scissors)
            Spacer()
            HandButton(onTap: {
                print(Hand.scissors.text)
            }, hand: .paper)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

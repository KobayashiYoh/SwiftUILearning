//
//  ContentView.swift
//  CounterApp
//
//  Created by 小林陽 on 2023/04/19.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0;
    var body: some View {
        VStack {
            Text("\(count)")
            Button(
                action: {self.count += 1}) {
                    Text("+")
                }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

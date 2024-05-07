//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nick Krasnitskiy on 07.05.2024.
//

import SwiftUI

struct ContentView: View {
    let items = ["mountain.2", "newspaper", "scissors"]
    let alternatives = ["Win", "Lose"]
    
    @State private var randomItem = Int.random(in: 0...2)
    @State private var alternative = Int.random(in: 0...1)
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: items[randomItem])
                .imageScale(.large)
            Text(alternatives[alternative])
                .font(.largeTitle)
            HStack(spacing: 50) {
                Button {
                    // rock
                } label: {
                    Image(systemName: "mountain.2")
                }
                
                Button {
                    // paper
                } label: {
                    Image(systemName: "newspaper")
                }
                
                Button {
                    // scissors
                } label: {
                    Image(systemName: "scissors")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

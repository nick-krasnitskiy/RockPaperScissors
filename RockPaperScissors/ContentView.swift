//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nick Krasnitskiy on 07.05.2024.
//

import SwiftUI

struct ContentView: View {
    let items = ["mountain.2", "newspaper", "scissors"]
    @State private var randomItem = Int.random(in: 0...2)
    
    var body: some View {
        Image(systemName: items[randomItem])
            .imageScale(.large)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nick Krasnitskiy on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    let moves = ["diamond.fill", "newspaper", "scissors"]
    let alternatives = ["Win", "Lose"]
    
    var randomElement: Int {
        Int.random(in: 0...2)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text(alternatives.randomElement() ?? "")
                .font(.largeTitle).bold()
                .foregroundStyle(.indigo)
            Image(systemName: moves[randomElement])
                .resizable()
                .frame(width: 110, height: 100)
                .foregroundStyle(.indigo)
            
            Spacer()
            
            HStack(spacing: 50) {
                ForEach(moves, id: \.self) { number in
                    Button {} label: {
                        Image(systemName: number)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(.indigo)
                    .clipShape(.circle)
                  
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

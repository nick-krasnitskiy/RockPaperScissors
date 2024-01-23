//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nick Krasnitskiy on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "🧻", "✂️"]
    let winnermoves = ["🧻", "✂️", "🪨"]
    let alternatives = ["Win", "Lose"]
 
    var randomElement: Int {
        Int.random(in: 0...2)
    }
    
    @State private var score = 0
    @State private var selectedChoice: Int = 1
    @State private var winLose: Bool = true
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text(alternatives.randomElement() ?? "")
                .font(.system(size: 50)).bold()
                .foregroundStyle(.indigo)
            Text(moves[randomElement])
                .font(.system(size: 150))
                      
            Spacer()
            
            HStack(spacing: 50) {
                ForEach(moves, id: \.self) { number in
                    Button {calculateScore(number)} label: {
                        Text(number)
                            .font(.system(size: 50))
                    }
                    .padding()
                    .background(.indigo)
                    .clipShape(.circle)
                }
            }
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.title)
            
            Spacer()
        }
    }
    
    func calculateScore(_ number: String) {
        
    }
}

#Preview {
    ContentView()
}

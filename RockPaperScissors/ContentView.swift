//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nick Krasnitskiy on 23.01.2024.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "✂️", "🧻"]

    @State private var randomElement = Int.random(in: 0...2)
    @State private var winLose = Bool.random()
    @State private var score = 0
    @State private var isShowingAlert = false
    @State private var numberOfQuestions: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text(winLose ? "Win" : "Lose")
                .font(.system(size: 50)).bold()
                .foregroundStyle(.indigo)
            
            Text(moves[randomElement])
                .font(.system(size: 150))
            
            Spacer()
            
            HStack(spacing: 50) {
                ForEach(moves.indices, id: \.self) { number in
                    Button {buttonTapped(number)} label: {
                        Text(moves[number])
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
        .alert("Game over!", isPresented: $isShowingAlert) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score: \(score)")
        }
    }
    
    func reset() {
        randomElement = Int.random(in: 0...2)
        winLose = Bool.random()
        numberOfQuestions = 0
        score = 0
    }
    
    func buttonTapped(_ number: Int) {
        let tupleIndexes = (randomElement, number)
        randomElement = Int.random(in: 0...2)
        winLose = Bool.random()
        numberOfQuestions += 1
        
        if winLose {
            switch tupleIndexes {
            case (0, 2), (1, 0), (2, 1):
                score += 1
            default:
                score -= 1
            }
        } else {
            switch tupleIndexes {
            case (0, 1), (1, 2), (2, 0):
                score += 1
            default:
                score -= 1
            }
        }
        
        if numberOfQuestions == 10 {
            isShowingAlert = true
        }
    }
}

#Preview {
    ContentView()
}

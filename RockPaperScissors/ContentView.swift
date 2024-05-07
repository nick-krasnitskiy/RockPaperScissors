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
    @State private var currentChoice = 0
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [
                    .init(color: Color(red: 0.5, green: 0.25, blue: 0.5), location: 0.5),
                    .init(color: Color(red: 0.2, green: 0.2, blue: 0.7), location: 0.5)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack(spacing: 30) {
                    Spacer()
                    Image(systemName: items[randomItem])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 200, height: 150)
                        .foregroundStyle(.indigo)
                    Text(alternatives[alternative])
                        .font(.largeTitle.bold())
                        .foregroundStyle(.indigo)
                    Spacer()
                    HStack(spacing: 20) {
                        Button {
                            currentChoice = 0
                            checkPlayerTap(currentChoice, randomItem, alternative)
                            refresh()
                        } label: {
                            ImageButton(name: "mountain.2")
                                .setButtonStyle()
                        }
                        
                        Button {
                            currentChoice = 1
                            checkPlayerTap(currentChoice, randomItem, alternative)
                            refresh()
                        } label: {
                            ImageButton(name: "newspaper")
                                .setButtonStyle()
                        }
                        
                        Button {
                            currentChoice = 2
                            checkPlayerTap(currentChoice, randomItem, alternative)
                            refresh()
                        } label: {
                            ImageButton(name: "scissors")
                                .setButtonStyle()
                        }
                    }
                    .padding()
                    
                    Spacer()
                    Text("Score: \(score)")
                        .font(.title2.bold())
                    Spacer()
                }
                .background(.thinMaterial)
                .padding(50)
            }
            .navigationTitle("Rock - Paper - Scissors")
        }
    }
    
    func checkPlayerTap(_ choice: Int, _ randomItem: Int, _ alternative: Int) {
        if (randomItem == 0 && choice == 1) || (randomItem == 1 && choice == 2) || (randomItem == 2 && choice == 0) {
            if alternative == 0 {
                score += 1
            } else {
                score -= 1
            }
        } else if choice == randomItem {
            score -= 1
        } else {
            if alternative == 0 {
                score -= 1
            } else {
                score += 1
            }
        }
    }
    
    func refresh() {
        randomItem = Int.random(in: 0...2)
        alternative = Int.random(in: 0...1)
    }
    
}

struct ImageButton: View {
    var name: String
    
    var body: some View {
        Image(systemName: name)
            .resizable()
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .foregroundStyle(.white)
            .background(.indigo)
            .clipShape(.circle)
    }
}

extension View {
    func setButtonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

#Preview {
    ContentView()
}

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
                            // rock
                        } label: {
                            ImageButton(name: "scissors")
                                .setButtonStyle()
                        }
                        
                        Button {
                            // paper
                        } label: {
                            ImageButton(name: "newspaper")
                                .setButtonStyle()
                        }
                        
                        Button {
                            // scissors
                        } label: {
                            ImageButton(name: "scissors")
                                .setButtonStyle()
                        }
                    }
                    .padding()
                    Spacer()
                }
                .background(.thinMaterial)
                .padding(50)
            }
            .navigationTitle("Rock - Paper - Scissors")
        }
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

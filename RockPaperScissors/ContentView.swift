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
                    Image(systemName: "mountain.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(.circle)
                }
                
                Button {
                    // paper
                } label: {
                    Image(systemName: "newspaper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(.circle)
                }
                
                Button {
                    // scissors
                } label: {
                    Image(systemName: "scissors")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(.circle)
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

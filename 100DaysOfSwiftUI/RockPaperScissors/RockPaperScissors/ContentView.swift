//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Xiang Liu on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: DEAL WITH SAME ACTION 
    
    private let action = ["Rock", "Paper", "Scissors"]
    @State private var currentScore = 0
    @State private var appAction = Int.random(in: 0..<3)
    @State private var userWin = Bool.random()
    
    @State private var gameNumberCount = 0
    @State private var showalert = false
    @State private var currentWin = false
    
    var body: some View {
        VStack(spacing: 30) {
            if gameNumberCount == 10 {
                Text("current score: \(currentScore)")
            }
            Text("PC action: \(action[appAction])")
            Text("Your goal: \(userWin ? "win" : "lose")")
            
            ForEach(0..<action.count) { index in
                Button(self.action[index]) {
                    let indexDiff = index - appAction
                    let point: Int
                    if indexDiff == 1 || indexDiff == -2 {
                        ///user win
                        point = userWin ? 1 : -1
                    } else {
                        point = userWin ? -1 : 1
                    }
                    currentWin = point > 0 ? true : false
                    showalert = true
                    currentScore += point
                    if gameNumberCount == 10 {
                        //reset
                        gameNumberCount = 0
                        currentScore = 0
                    } else {
                        gameNumberCount += 1
                    }
                    
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(isPresented: $showalert, content: {
            return Alert(title: Text(currentWin ? "Win" : "Lose"), message: nil, dismissButton: .default(Text("Continue")) {
                // random again
                appAction = Int.random(in: 0..<3)
                userWin = Bool.random()
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

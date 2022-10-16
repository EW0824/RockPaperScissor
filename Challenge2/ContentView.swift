//
//  ContentView.swift
//  Challenge2
//
//  Created by OAA on 14/08/2022.
//

import SwiftUI







struct ContentView: View {
    
    let choices = ["Rock", "Paper", "Scissors"]
    
    @State private var appChoice = Int.random(in: 0...2)
    @State private var playerWin = Bool.random()
    
    @State private var playerChoice = 0
    
    @State private var score = 0
    @State private var scoreTitle = ""
    
    @State private var gameNumber = 0
    @State private var gameEnds = false
    @State private var showingScore = false
    
    var body: some View {
        
        
        ZStack{
            
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(stops: [
                .init(color: Color(red: 1, green: 0, blue: 0), location: 0.1),
                .init(color: Color(red: 1, green: 0.5, blue: 0.1), location: 0.3),
                .init(color: Color(red: 1, green: 1, blue: 0.3), location: 1.1)], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Group{
                    Spacer()
                    Text("Rock Paper Scissors")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text("App's move: ")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Image(choices[appChoice])
                        .resizable()
                        .frame(width: 64, height: 64)
                    
                    Text("Your goal is to: \(playerWin == true ? "win" : "lose" )")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button {
                        playerSelected(0)
                    } label: {
                        Image("Rock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Button {
                        playerSelected(1)
                    } label: {
                        Image("Paper")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Button {
                        playerSelected(2)
                    } label: {
                        Image("Scissors")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.system(size: 24, weight: .heavy, design: .rounded))

                Text("Game number: \(gameNumber)")
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newRound)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game has ended", isPresented: $gameEnds) {
            Button("Reset", action: reset)
        } message: {
            Text("Do you want to play again?")
        }
        
        
    }
    
    func playerSelected(_ playerChoice: Int) {
        
        if playerWin == true {
            if (playerChoice == 0 && appChoice == 2) || (playerChoice == 1 && appChoice == 0) || (playerChoice == 2 && appChoice == 1 ){
                scoreTitle = "Well done!"
                score += 1
            } else {
                scoreTitle = "Sorry, that's not correct"
            }
        } else {
            if (playerChoice == 0 && appChoice == 1) || (playerChoice == 1 && appChoice == 2) || (playerChoice == 2 && appChoice == 0 ){
                scoreTitle = "Well done!"
                score += 1
            } else {
                scoreTitle = "Sorry, that's not correct"
            }
        }
        
        gameNumber += 1
        showingScore.toggle()
    }
    
    
    func newRound() {
        if gameNumber == 10 {
            gameEnds = true
            return
        }
        
        appChoice = Int.random(in: 0...2)
        playerWin = Bool.random()
        
    }
    
    func reset() {
        gameEnds = false
        gameNumber = 0
        score = 0
        newRound()
    }
    
    
    
    
    
    
    
    
    
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

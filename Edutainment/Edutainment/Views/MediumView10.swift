//
//  MediumView10.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 10 medium questions, the only thing that is changed from EasyView5 is the range of numbers being from 0-5 to instead 2-7 */

import SwiftUI
struct MediumView10: View {
    @State private var questionNumber = 1
    @State private var randomNumber1 = Int.random(in: 2...7)
    @State private var randomNumber2 = Int.random(in: 2...7)
    @State private var randomEmoji = Int.random(in: 0...4)
    @State private var selection: Int = 0
    @State private var scoreTitle = ""
    @State private var showAlert = false
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var userScore = 0
    @State private var emojiArray = ["🤔", "🦄", "👽", "🤠"].shuffled()
    @State private var animationAmount = 0.0
    
    let maxQuestions = 10

    
    var answer: Int {
        let realAnswer = randomNumber1 * randomNumber2
        return realAnswer
    }
    
    var products: [Int] {
        var productsSet = Set<Int>()
        
        for a in 2...7 {
            for b in 2...7 {
                productsSet.insert(a * b)
            }
        }
        return productsSet.sorted()  
    }
    
    
    var body: some View {
        ZStack {
            backgroundGradient()
            
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Ready for the next question?")
                }
            
                .alert(scoreTitle, isPresented: $gameOver) {
                    Button("Game Over! Restart?", action: restartGame)
                } message: {
                    Text("Your Score Was \(userScore) ")
                }
            
            VStack  {
                Text("Your Score: \(userScore)")
                    .ScoreTextStyle()
                Spacer()
                Text("Question \(questionNumber) / \(maxQuestions) 🤩")
                    .questionTextStyle()
                Spacer()
                .padding(0)
                Text("\(emojiArray[randomEmoji])\(randomNumber1) x \(randomNumber2) = ?")
                    .problemTextStyle()
                Spacer()
                .padding()
                Picker("Select a Number", selection: $selection) {
                    ForEach(products, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Spacer()
                .padding()
                Button(action: { numberSelected(selection) }) {
                    Text("Tap Here To Enter Answer 🚨")
                        .buttonTextStyle()
                    
                }
                .rotationEffect(.degrees(animationAmount))
                .animation(.easeInOut(duration: 1.0), value: animationAmount)  
            }
        }
    }
    
    func numberSelected(_ number: Int) {
        if questionNumber != 10 {
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                questionNumber += 1
            }
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                questionNumber += 1
            }
            showingScore = true
        }
        else if questionNumber == 10  {
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                gameOver = true
            }
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                gameOver = true
            }
        }
        else {
            gameOver = true
        }
        // Spin the selected flag
        withAnimation {
            animationAmount += 360
        }
    }
    
    func askQuestion() {
        emojiArray.shuffle()
        randomNumber1 = Int.random(in: 2...7)
        randomNumber2 = Int.random(in: 2...7)
        selection = products.randomElement() ?? 0
    }
    
    func restartGame() {
        userScore = 0
        questionNumber = 1
        randomNumber1 = Int.random(in: 2...7)
        randomNumber2 = Int.random(in: 2...7)
        selection = products.randomElement() ?? 0
    }
}

#Preview {
    MediumView10()
}

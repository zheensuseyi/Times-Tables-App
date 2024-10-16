//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
struct EasyView5: View {
    // Question number tracker that starts at 1
    @State private var questionNumber = 1
    // Variable to hold a random number 0-5 (this gets changed in other views)
    @State private var randomNumber1 = Int.random(in: 0...5)
    // Another variable to hold a random number 0-5 (this gets changed in other views)
    @State private var randomNumber2 = Int.random(in: 0...5)
    // Variable that will be used to pick a random emoji from an array
    @State private var randomEmoji = Int.random(in: 0...4)
    // Variable that will be used for the Picker selection
    @State private var selection: Int = 0
    // Score Title that will be updated for the button
    @State private var scoreTitle = ""
    // Alert variable that triggers an alert when a selection is entered
    @State private var showingScore = false
    // Alert variable that triggers an alert once max questions have been reached
    @State private var gameOver = false
    // Variable for keeping track of the user score
    @State private var userScore = 0
    // Emoji array that gets shuffled
    @State private var emojiArray = ["🤔", "🦄", "👽", "🤠"].shuffled()
    // Animation variable
    @State private var animationAmount = 0.0
    
    // Max number of questions (this gets changed in other views)
    let maxQuestions = 5

    // Computed property that returns the answer to randomNumber * randomNumber2
    var answer: Int {
        let realAnswer = randomNumber1 * randomNumber2
        return realAnswer
    }
    
    // Computed property that creates a set of answers for the selector (this gets changed in other views)
    var products: [Int] {
        var productsSet = Set<Int>()
        // First variable loops through numbers 0-5
        for a in 0...5 {
            // Second variable loops through numbers 0-5
            for b in 0...5 {
                // Inserts the product of both variables into a new set, will do this for all numbers 0-5
                productsSet.insert(a * b)
            }
        }
        // returns the set which means no duplicates
        return productsSet.sorted()
    }
    
    
    var body: some View {
        ZStack {
            backgroundGradient()
            
                // Alert that triggers when the user enters an answer and it isn't the last question (this gets changed in other views)
                // This alert calls the askQuestion function
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Ready for the next question?")
                }
            
                // Alert that triggers when the user enters an answer and its the last question (this gets changed in other views)
                // This alert calls the restartGame function
                .alert(scoreTitle, isPresented: $gameOver) {
                    Button("Game Over! Restart?", action: restartGame)
                } message: {
                    Text("Your Score Was \(userScore) ")
                }
            
            VStack  {
                
                // Shows the user their score
                Text("Your Score: \(userScore)")
                    // Custom text extension
                    .ScoreTextStyle()
                Spacer()
                
                // Shows the number of questions that updates
                Text("Question \(questionNumber) / \(maxQuestions) 🤩")
                    // Custom text extension
                    .questionTextStyle()
                Spacer()
                .padding(0)
                
                // Shows the user the problem that must be solved, random emoji is assigned with every new problem
                Text("\(emojiArray[randomEmoji])\(randomNumber1) x \(randomNumber2) = ?")
                    .problemTextStyle()
                Spacer()
                .padding()
                
                // Picker selector, this is how the user will select their answer
                Picker("Select a Number", selection: $selection) {
                    ForEach(products, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                
                // Wheel Style picker
                .pickerStyle(WheelPickerStyle())
                Spacer()
                .padding()
                
                // Button that lets the user enter the answer they selected from the picker, calls the numberSelected function.
                Button(action: { numberSelected(selection) }) {
                    Text("Tap Here To Enter Answer 🚨")
                        .buttonTextStyle()
                    
                }
                
                // Rotational Effect Animation applied to the button once tapped
                .rotationEffect(.degrees(animationAmount))
                // This makes the animation stop after a second
                .animation(.easeInOut(duration: 1.0), value: animationAmount)
            }
        }
    }
    
    // Function for when the user submits an answer, takes the submitted answer as a parameter
    func numberSelected(_ number: Int) {
        // if questionNumber != 5, do this
        if questionNumber != 5 {
            // If answer is correct, tell user its correct, add 1 to userScore, and add 1 to questionNumber
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                questionNumber += 1
            }
            // questionNumber goes up, tell user the answer is incorrect and give correct answer
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                questionNumber += 1
            }
            // This triggers the alert
            showingScore = true
        }
        
        // if questionNumber == 5, do this (this changes with other views)
        else if questionNumber == 5  {
            // If answer is correct, tell user its correct, add to userScore, and set gameOver to true
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                gameOver = true
            }
            // Tells user the answer is incorrect and give correct answer, set gameOver to true
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                gameOver = true
            }
        }
        // Set gameOver to true once maxQuestions is reached
        else {
            gameOver = true
        }
        // Spins the Button 360 degrees
        withAnimation {
            animationAmount += 360
        }
    }
    
    // askQuestion function that gives the user a new question, an alert calls this function
    func askQuestion() {
        // Shuffles the emojiArray so that a random emoji is chosen for the question
        emojiArray.shuffle()
        // Shuffles both randomNumbers (the range changes in other difficulties)
        randomNumber1 = Int.random(in: 0...5)
        randomNumber2 = Int.random(in: 0...5)
        // resets and shuffles the selector
        selection = products.randomElement() ?? 0
    }
    
    // restartGame function when user reaches max questions, an alert calls this function
    func restartGame() {
        // reset user score
        userScore = 0
        // reset questionNumber
        questionNumber = 1
        // Shuffles both randomNumbers (the range changes in other difficulties)
        randomNumber1 = Int.random(in: 0...5)
        randomNumber2 = Int.random(in: 0...5)
        // resets and shuffles the selector
        selection = products.randomElement() ?? 0
    }
}

#Preview {
    EasyView5()
}

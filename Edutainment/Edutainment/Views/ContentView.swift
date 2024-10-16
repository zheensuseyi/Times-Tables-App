//
//  ContentView.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/11/24.
//
/*
 Your goal is to build an “edutainment” app for kids to help them practice multiplication tables – “what is 7 x 8?” and so on. Edutainment apps are educational at their core, but ideally have enough playfulness about them to make kids want to play.

 Breaking it down:

 1. The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
2. The player should be able to select how many questions they want to be asked: 5, 10, or 20.
3. You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
4. If you want to go fully down the “education” route then this is going to be some steppers, a text field and a couple of buttons. I would suggest that’s a good place to start, just to make sure you have the basics covered.

 Once you have that, it’s down to you how far you want to take the app down the “entertainment” route – you could throw away fixed controls like Stepper entirely if you wanted, and instead rely on colorful buttons to get the same result.
 */

/* Home Screen, makes the user chose a difficulty between easy, medium, or hard. User must tap one of the 3 images in order to proceed to the next screen */
import SwiftUI
struct ContentView: View {
    var body: some View {
        // Wrapping everything in a navigation stack so that the user can navigate between screens
        NavigationStack {
            // ZStack with our custom background imported from a seperate file extension
            ZStack {
                backgroundGradient()
                // Wrapping everything in a VStack
                VStack(spacing: -46) {
                    // Title with custom text modifier from seperate file extension
                    Text("SELECT PRACTICE TABLE🦾")
                        .QSelectTextStyle()
                    Spacer()
                    
                    // Easy Tables practice, upon tap it takes user to the next screen
                    NavigationLink(destination: EasyQuestionSelect()) {
                        Image("easytablefinal")
                            // Custom Image Modifier from extension
                            .customImageStyle2()
                    }
                    Spacer()
                    
                    // Medium Tables practice, upon tap it takes user to the next screen
                    NavigationLink(destination: MediumQuestionSelect()) {
                        Image("mediumtable")
                            .customImageStyle2()
                    }
                    Spacer()
                    
                    // Hard Tables practice, upon tap it takes user to the next screen
                    NavigationLink(destination: HardQuestionSelect()) {
                        Image("hardtables")
                            .customImageStyle2()
                    }
                }
            }
        }
    }

}
                
#Preview {
    ContentView()
}

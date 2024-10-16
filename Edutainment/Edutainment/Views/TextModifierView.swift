//
//  TextModifierView.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//

import SwiftUI

// For # Of Questions Image Modifers
extension Image {
    func customImageStyle(width: CGFloat = 100, height: CGFloat = 100, cornerRadius: CGFloat = 10, shadowRadius: CGFloat = 5) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}

// For Home Screen Difficulty Select Image Modifers
extension Image {
    func customImageStyle2(width: CGFloat = 175, height: CGFloat = 175, cornerRadius: CGFloat = 14, shadowRadius: CGFloat = 5) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 325, height: 325)
    }
}


// Question Text Modifier Extension
extension View {
    func questionTextStyle() -> some View {
        self.modifier(TextModifierView2())
    }
}

// Button Modifier Text Extension
extension View {
    func buttonTextStyle() -> some View {
        self.modifier(TextModifierView3())
    }
}

// Question Select Text Modifier Extension
extension View {
    func QSelectTextStyle() -> some View {
        self.modifier(TextModifierView4())
    }
}

// User Score Text Modifier Extension
extension View {
    func ScoreTextStyle() -> some View {
        self.modifier(TextModifierView5())
    }
}

// Problem given Text Modifier Extension
extension View {
    func problemTextStyle() -> some View {
        self.modifier(TextModifierView6())
    }
}

// Background ZStack Modifier Extension
extension View {
    func backgroundGradient() -> some View {
        LinearGradient(gradient: Gradient(colors: [.pink, .teal, .blue]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}


// Text Modifier 
struct TextModifierView2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(Color .white)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
           
    }
}

// Text Modifier
struct TextModifierView3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(Color .white)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}
// Text Modifier
struct TextModifierView4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25, weight: .bold))
            .foregroundStyle(Color .white)
            .multilineTextAlignment(.center)
            .padding()
    }
}

// User Score Text Modifier
struct TextModifierView5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(Color .green)
            .multilineTextAlignment(.center)
    }
}

// Asking Problem Text Modifier
struct TextModifierView6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 42, weight: .bold))
            .foregroundStyle(Color .black)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

// Background gradient for ZStack modifier, will use this in every screen
struct TextModifierView7: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(gradient: Gradient(colors: [.pink, .teal, .blue]), startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
    }
}

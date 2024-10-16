//
//  MediumQuestionSelect.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Pretty much the same code as the other # of questions screens, just takes the user to the medium game mode instead */

import SwiftUI
struct MediumQuestionSelect: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient()
                VStack {
                    Text("SELECT # OF QUESTIONS 😎")
                        .QSelectTextStyle()
                    Spacer()
                    NavigationLink(destination: MediumView5()) {
                        Image("5pic")
                            .customImageStyle()
                        }
                    Spacer()
                    NavigationLink(destination: MediumView10()) {
                        Image("10pic")
                            .customImageStyle()

                     }
                    Spacer()
                    NavigationLink(destination: MediumView20()) {
                        Image("20pic")
                            .customImageStyle() 
                    }
                }
            }
        }
    }
}

#Preview {
    MediumQuestionSelect()
}

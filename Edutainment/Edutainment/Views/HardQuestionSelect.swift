//
//  HardQuestionSelect.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Pretty much the same code as the other diffculty question selects, just takes the user to the hard game mode instead */

import SwiftUI
struct HardQuestionSelect: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient()
                VStack {
                    Text("SELECT # OF QUESTIONS 😼")
                        .QSelectTextStyle()
                    Spacer()
                    NavigationLink(destination: HardView5()) {
                        Image("5pic")
                            .customImageStyle()
                        }
                    Spacer()
                    NavigationLink(destination: HardView10()) {
                        Image("10pic")
                            .customImageStyle()

                     }
                    Spacer()
                    NavigationLink(destination: HardView20()) {
                        Image("20pic")
                            .customImageStyle() 
                    }
                }
            }
        }
    }
}

#Preview {
    HardQuestionSelect()
}

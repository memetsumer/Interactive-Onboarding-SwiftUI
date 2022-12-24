//
//  CTA.swift
//  Instagram
//
//  Created by Mehmet Sümer on 24.12.2022.
//

import Foundation

import SwiftUI

struct CTA: View {
    @Binding var change: Bool
    @Binding var changeText: Bool
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.3)) {
                change.toggle()
            }
            withAnimation {
                changeText.toggle()
            }
                    }) {
                        Text("Start Journey")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color("main"), Color("secondary")]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                    }
    }
}


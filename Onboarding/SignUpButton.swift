//
//  SignUpButton.swift
//  Instagram
//
//  Created by Mehmet Sümer on 24.12.2022.
//

import SwiftUI

struct SignUpButton: View {
    var message: String = "Sign Up with Apple"
    var body: some View {
        Button(action: {
            
        }) {
            Text(message)
                .font(.body)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color("main"), Color("secondary")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
        }.padding(.horizontal)
        
    }
}

struct SignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButton()
    }
}

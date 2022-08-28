//
//  SecureTextField.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct SecureTextField: View {
    var imageName: String
    var placeholder: String
    @Binding var text: String
    var body: some View {
        ZStack {
            Color("Light")
                .ignoresSafeArea()
            
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(.gray.opacity(0.6))
                Spacer()
                SecureField(placeholder, text: $text)
                    .foregroundColor(.white.opacity(0.8))
                    .autocapitalization(.none)
                    
                
                
            }
            
            .padding(.horizontal)
        }
        .frame(width: 300, height: 60)
        .cornerRadius(10)
    }
}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField(imageName: "lock", placeholder: "Password", text: .constant("hello123"))
    }
}

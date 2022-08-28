//
//  AuthButton.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct AuthButton: View {
    var text: String
    var body: some View {
        ZStack {
            Color("Dark")
                .ignoresSafeArea()
            
            Text(text)
                .font(.system(size: 22))
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 320, height: 55)
        .cornerRadius(15)
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(text: "Sign Up")
    }
}

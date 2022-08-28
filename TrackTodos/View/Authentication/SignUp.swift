//
//  SignUp.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct SignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("TrackTodo")
                                .font(.system(size: 50).bold())
                                .foregroundColor(.white)
                            
                            Text(" Never miss a Task")
                                .font(.system(size: 20).bold())
                                .foregroundColor(.gray.opacity(0.6))
                            
                        } // VStack
                        
                        Spacer()
                    } // HStack
                    
                    
                    Spacer()
                    
                    VStack(spacing: 40) {
                        StandardTextField(imageName: "envelope", placeholder: "Email", text: $email)
                        
                        SecureTextField(imageName: "lock", placeholder: "Password", text: $password)
                        Spacer()
                        Button {
                            authViewModel.registerUser(withEmail: email, password: password)
                        } label: {
                            AuthButton(text: "Sign Up")
                        }
                        Spacer()
                    } // VStack
                    
                    
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HStack {
                        Text("Already have an account?")
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("Login")
                        }
                        
                    }
                    
                    
                    
                    
                    
                } // VStack
                .padding(.horizontal, 40)
                .padding(.vertical, 30)
                
            } // ScrollView
            .navigationBarHidden(true)
        }
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

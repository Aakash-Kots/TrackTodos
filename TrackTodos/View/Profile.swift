//
//  Profile.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 29/08/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
               
                
                Button {
                    // delete account
                } label: {
                    Text("Delete Account")
                        .foregroundColor(.black)
                        .frame(width: 200, height: 40)
                        .background(Color(.systemRed))
                        .cornerRadius(20)
                }
                

            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

//
//  CategoryButton.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct CategoryButton: View {
    var text: String
    var selected: Bool
    var body: some View {
        ZStack {
            
            if(selected) {
                Color.cyan.opacity(0.7)
                    .ignoresSafeArea()
            } else {
                Color("Light")
                    .ignoresSafeArea()
            }
            
            Text(text)
                .font(.system(size: 15))
                .bold()
                .foregroundColor(selected ? .black : .white)
        }
        .frame(width: 120, height: 40)
        .cornerRadius(15)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryButton(text: "School", selected: false)
            CategoryButton(text: "School", selected: true)
        }
        
    }
}

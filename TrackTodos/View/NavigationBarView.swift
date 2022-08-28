//
//  NavigationBarView.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        TabView() {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}

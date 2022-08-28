//
//  TrackTodosApp.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import SwiftUI
import Firebase
@main
struct TrackTodosApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
                .environmentObject(TodoViewModel.shared)
        }
    }
}

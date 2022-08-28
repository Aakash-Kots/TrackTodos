//
//  AuthViewModel.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var currentUser: AppUser?
    
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        fetchUser()
    }
    static let shared = AuthViewModel()
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        USER_COLLECTION.document(uid).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user
        }
    }
    
    func registerUser(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            let data: [String: Any?] = ["uid": user.uid, "email": user.email]
            USER_COLLECTION.document(user.uid).setData(data as [String: Any]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.userSession = user
                self.fetchUser()
            }
            
        }
    }
    
    func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signOut() {
        
        try? Auth.auth().signOut()
    }
    
}

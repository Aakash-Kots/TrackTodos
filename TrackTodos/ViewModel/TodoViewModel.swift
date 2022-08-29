//
//  TodoViewModel.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var loading: Bool = false
    
    
    
    init() {
        self.loadTodos()
    }
    
    static let shared = TodoViewModel()
    
    func loadTodos() {
        
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser?.uid ?? "").collection("Todos").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            
            guard let documents = snapshot?.documents else { return }
            
            self.todos = documents.compactMap({ snapshot in
                
                
                let y = snapshot.data()
                
                let todo = Todo(uid: y["uid"] as! String, title: y["title"] as! String, description: y["description"]! as! String, category: y["category"] as! String, completed: y["completed"] != nil ? y["completed"] as! Bool : false, dateAdded: Date(timeIntervalSince1970: y["dateAdded"] as! TimeInterval), dateCompleted: y["dateCompleted"] as? Date, dateToBeCompleted: Date(timeIntervalSince1970: y["dateToBeCompleted"] as! TimeInterval))
                
                return todo
            })
            
            self.todos.sort { !$0.completed && $1.completed }
            
            
        }
    }
    
    
    
    func createTodo(todo: Todo) {
        
        guard let currentUser = Auth.auth().currentUser else { return }
        let data: [String: Any?] = ["uid": todo.uid, "title": todo.title, "description": todo.description, "category": todo.category, "completed": false, "dateAdded": todo.dateAdded.timeIntervalSince1970, "dateCompleted": nil, "dateToBeCompleted": todo.dateToBeCompleted?.timeIntervalSince1970 ]
        
        Firestore.firestore().collection("Users").document(currentUser.uid).collection("Todos").document(todo.uid).setData(data as [String : Any]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        self.loadTodos()
    }
    
    func completeTodo(todoId: String) {
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser?.uid ?? "").collection("Todos").document(todoId).updateData(["completed": true, "dateCompleted": Date.now.timeIntervalSince1970]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.loadTodos()
        }
    }
    func uncompleteTodo(todoId: String) {
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser?.uid ?? "").collection("Todos").document(todoId).updateData(["completed": false, "dateCompleted": nil]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.loadTodos()
        }
    }
    
    
    func updateTodo(todo: Todo) {
        let data: [String: Any?] = ["uid": todo.uid, "title": todo.title, "description": todo.description, "category": todo.category, "completed": todo.completed, "dateAdded": todo.dateAdded.timeIntervalSince1970, "dateToBeCompleted": todo.dateToBeCompleted?.timeIntervalSince1970]
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser?.uid ?? "").collection("Todos").document(todo.uid).updateData(data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.loadTodos()
        }
    }
    
    func deleteTodo(todoID: String) {
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser?.uid ?? "").collection("Todos").document(todoID).delete { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.loadTodos()
        }
    }
}

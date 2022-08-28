//
//  Todo.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Todo: Decodable {
    
    let uid: String
    let title: String
    let description: String
    let category: String
    var completed: Bool 
    let dateAdded: Date
    let dateCompleted: Date?
    let dateToBeCompleted: Date?
    
    
    mutating func uncomplete() {
        self.completed = false
    }
    
    mutating func complete() {
        self.completed = true
    }
}

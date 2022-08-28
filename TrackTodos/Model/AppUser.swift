//
//  AppUser.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import Foundation
import FirebaseFirestoreSwift


struct AppUser: Decodable, Identifiable {
    @DocumentID var id: String?
    let uid: String
    let email: String
}

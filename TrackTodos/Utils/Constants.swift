//
//  Constants.swift
//  TrackTodos
//
//  Created by Aakash Kothari on 26/08/22.
//

import Foundation
import Firebase
import FirebaseFirestore




let USER_COLLECTION = Firestore.firestore().collection("Users")
let categories: [String] = ["School", "Shopping", "Extras"]

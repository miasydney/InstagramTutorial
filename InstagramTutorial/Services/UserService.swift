//
//  UserService.swift
//  InstagramTutorial
//
//  Created by Mia on 5/7/2024.
//

import Foundation
import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .getDocument(as: User.self)
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument() // get correct user document
        return try snapshot.data(as: User.self)
        print("DEBUG: Snapshot data is \(snapshot.data())")
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}

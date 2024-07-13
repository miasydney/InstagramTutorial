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
        
        self.currentUser = try await FirebaseConstants
            .UsersCollection
            .document(uid)
            .getDocument(as: User.self)
    }

    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).getDocument() // get correct user document
        return try snapshot.data(as: User.self)
//        print("DEBUG: Snapshot data is \(snapshot.data())")
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}

// MARK: - Following

extension UserService {
    
    static func follow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:])
        
        async let _ = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .setData([:])
    }
    
    static func unfollow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete()
        
        async let _ = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .delete()
    }
    
    static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirebaseConstants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument()

        return snapshot.exists
    }
    
}

// MARK: - User stats

extension UserService {
    static func fetchUserStats(uid: String) async throws -> UserStats {
        async let followingSnapshot = try await FirebaseConstants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
        let followingCount = try await followingSnapshot.count
        
        async let followersSnapshot = try await FirebaseConstants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
        let followerCount = try await followersSnapshot.count
        
        async let postSnapshot = try await FirebaseConstants
            .PostsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        let postsCount = try await postSnapshot.count
        
        print("DEBUG: Did call fetch user stats...")
        return .init(followingCount: followingCount, followersCount: followerCount, postsCount: postsCount)
    }
}

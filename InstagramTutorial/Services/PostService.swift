//
//  PostService.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Firebase


struct PostService {
    
    private static let postsCollection = FirebaseConstants.PostsCollection
    
    static func fetchFeedPosts() async throws -> [Post] {
        
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments() // ge all psots where owner uid is equal to owner uid on post
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
    
    static func fetchPost(_ postId: String) async throws -> Post {
        return try await FirebaseConstants
            .PostsCollection
            .document(postId)
            .getDocument(as: Post.self)
    }
}


// MARK: - Likes

extension PostService {
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return } // id of current user logged in who is liking the post
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).setData([:]) // list uid associated with who has liked the post
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false } // current user id
        
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).getDocument()
        return snapshot.exists
    }
    
}

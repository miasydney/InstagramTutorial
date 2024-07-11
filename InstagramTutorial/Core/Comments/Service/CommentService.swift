//
//  CommentService.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import FirebaseFirestoreSwift
import Firebase

// uploading comments to firebase

struct CommentService {
    
    static func uploadComment(_ comment: Comment, postId: String) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        // upload to firebase
        try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
    
}

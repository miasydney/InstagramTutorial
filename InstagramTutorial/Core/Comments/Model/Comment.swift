//
//  Comment.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String? // gets direct id from firebase db
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerUid: String
    
    var user: User?

    var id: String {
        return commentId ?? NSUUID().uuidString
    }
    
}

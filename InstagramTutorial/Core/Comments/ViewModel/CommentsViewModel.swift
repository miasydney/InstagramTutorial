//
//  CommentsViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Firebase

class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post // all comments need a post, so initialise commentsviewmodel with post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return } // currently logged in user id
        
        let comment = Comment(
            postOwnerUid: post.ownerUid,
            commentText: commentText,
            postId: post.id,
            timestamp: Timestamp(),
            commentOwnerUid: uid
        )
        
        // call service function to upload a comment to the db
        try await CommentService.uploadComment(comment, postId: post.id)
    }
}

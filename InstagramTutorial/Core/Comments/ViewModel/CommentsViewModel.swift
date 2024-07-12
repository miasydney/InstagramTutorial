//
//  CommentsViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post // all comments need a post, so initialise commentsviewmodel with post
    private let service: CommentService
    
    init(post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
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
        
        self.comments.insert(comment, at: 0)
        // call service function to upload a comment to the db
        try await service.uploadComment(comment)
        try await fetchComments()
    }
    
    func fetchComments() async throws {
        self.comments = try await service.fetchComments() // wait for results to come back
        try await fetchUserDataForComments() // fetch user data for comment 
    }
    
    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
    
}

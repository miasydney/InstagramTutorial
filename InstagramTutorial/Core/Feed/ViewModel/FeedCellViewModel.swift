//
//  FeedCellViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        Task { try await checkIfUserLikedPost() }
    }
    
    func like() async throws {
        do {
            let postCopy = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(postCopy)
            NotificationManager.shared.uploadLikeNotification(toUid: post.ownerUid, post: post)
        } catch {
            // if API call goes wrong, reset to UI changes.
            post.didLike = false
            post.likes -= 1
        }
    }
    
    func unlike() async throws {
        do {
            let postCopy = post
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePost(postCopy)
        } catch {
            post.didLike = true
            post.likes += 1
        }

    }
    
    func checkIfUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfUserLikedPost(post)
    }
    
}

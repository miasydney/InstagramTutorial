//
//  FeedViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import Foundation
import Firebase

// fetch posts from db and populate feed with those posts

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPost() async throws {
        self.posts = try await PostService.fetchFeedPosts()
        
    }
    
}

//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by Mia on 1/7/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User // initialise profile view with a user
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(posts: posts)
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}

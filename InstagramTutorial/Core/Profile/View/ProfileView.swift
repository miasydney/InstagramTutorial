//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by Mia on 1/7/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User // initialise profile view with a user
        
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(user: user)
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}

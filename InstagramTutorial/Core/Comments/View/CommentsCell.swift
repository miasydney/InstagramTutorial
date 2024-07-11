//
//  CommentsCell.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import SwiftUI

struct CommentsCell: View {
    
    private var user: User {
        return User.MOCK_USERS[0]
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    Text("6d")
                        .foregroundColor(.gray)
                }
                
                Text("How's the back of my car look")
            }
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentsCell()
}

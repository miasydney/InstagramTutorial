//
//  CommentsView.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import SwiftUI

struct CommentsView: View {
    @State private var commentText = ""
    
    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            // list of comments
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0 ... 15, id: \.self) { comment in
                        CommentsCell()
                    }
                }
            }
            .padding(.top)
            
            Divider()
            
            // add a comment section
            HStack(spacing: 12) {
                CircularProfileImageView(user: User.MOCK_USERS[0], size: .xSmall)
                
                ZStack(alignment: .trailing) {
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    
                    Button {
                        
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    CommentsView()
}

//
//  NotificationsView.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var viewModel = NotificationsViewModel(service: NotificationService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                            .padding(.top)
                    }
                }
            }
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}

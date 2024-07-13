//
//  NotificationsView.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0 ..< 15) { notification in
                        NotificationCell()
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}

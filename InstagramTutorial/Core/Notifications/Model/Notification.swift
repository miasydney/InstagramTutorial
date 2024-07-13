//
//  Notification.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Firebase

struct Notification: Identifiable, Codable {
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
}


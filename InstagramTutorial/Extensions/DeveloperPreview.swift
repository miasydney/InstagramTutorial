//
//  DevelopetPreview.swift
//  InstagramTutorial
//
//  Created by Mia on 11/7/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerUid: "123", commentText: "Test comment for now", postId: "1234", timestamp: Timestamp(), commentOwnerUid: "12345678")
    
    let notifications: [Notification] = [
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .comment),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .follow)
    ]
}

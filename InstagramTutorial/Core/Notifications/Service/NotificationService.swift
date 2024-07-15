//
//  NotificationService.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Firebase

class NotificationService {
    
    func fetchNotifications() async throws -> [Notification] {
        return DeveloperPreview.shared.notifications
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return } // get current user id and make sure not sending notification to yourself
        
        let ref = FirebaseConstants.NotificationCollection.document(uid).collection("user-notifications").document()
        let notification = Notification(id: ref.documentID,
                                        postId: post?.id,
                                        timestamp: Timestamp(),
                                        notificationSenderUid: currentUid,
                                        type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        ref.setData(notificationData)
        
    }
    
    func deleteNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        
    }
}

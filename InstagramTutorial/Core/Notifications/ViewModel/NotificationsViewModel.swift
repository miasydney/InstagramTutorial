//
//  NotificationsViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        self.notifications = DeveloperPreview.shared.notifications
    }
}

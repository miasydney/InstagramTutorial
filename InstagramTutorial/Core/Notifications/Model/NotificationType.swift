//
//  NotificationType.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like:
            return "liked one of your posts."
        case .comment:
            return "commented on one of your posts."
        case .follow:
            return "started following you"
        }
    }
}

//
//  Post.swift
//  InstagramTutorial
//
//  Created by Mia on 2/7/2024.
//

import Foundation

// represents a users post
struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

// mock posts
extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption for now", likes: 120, imageUrl: "newyork-image", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Exploring the city vibes 🌆", likes: 85, imageUrl: "tenniscourt", timestamp: Date(timeIntervalSinceNow: -3600), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Sunset views from the beach 🌅", likes: 200, imageUrl: "beach", timestamp: Date(timeIntervalSinceNow: -7200), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Coffee and books - perfect combo! ☕️📚", likes: 150, imageUrl: "coffee", timestamp: Date(timeIntervalSinceNow: -10800), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Hiking adventures in the mountains ⛰️", likes: 180, imageUrl: "nature", timestamp: Date(timeIntervalSinceNow: -14400), user: User.MOCK_USERS[1])
    ]
}

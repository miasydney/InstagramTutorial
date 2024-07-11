//
//  Post.swift
//  InstagramTutorial
//
//  Created by Mia on 2/7/2024.
//

import Foundation
import Firebase

// represents a users post
struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp // custom firebase timestamp object
    var user: User?
    
    var didLike: Bool? = false
}

// mock posts
extension Post {
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com:443/v0/b/instagramswiftui-59a8e.appspot.com/o/profile_images%2F63788FB4-F0A6-4DFD-8E0E-594BF4071734?alt=media&token=aaecf282-995b-4d98-9c0a-e3cdd255897e"
    
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is some test caption for now", likes: 120, imageUrl: "newyork-image", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Exploring the city vibes 🌆", likes: 85, imageUrl: "tenniscourt", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Sunset views from the beach 🌅", likes: 200, imageUrl: "beach", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Coffee and books - perfect combo! ☕️📚", likes: 150, imageUrl: "coffee", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Hiking adventures in the mountains ⛰️", likes: 180, imageUrl: "nature", timestamp: Timestamp(), user: User.MOCK_USERS[1])
    ]
}

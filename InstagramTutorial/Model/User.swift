//
//  User.swift
//  InstagramTutorial
//
//  Created by Mia on 2/7/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "profilephoto", fullname: "Bruce Wayne", bio: "Gotham", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "haighs", profileImageUrl: "profilephoto", fullname: "haigh's chocolate", bio: "chocolate pastilles", email: "haighs@gmail.com"),
        .init(id: NSUUID().uuidString, username: "lindt", profileImageUrl: "profilephoto", fullname: "Lindt", bio: "chocolate bars", email: "lindt@gmail.com"),
        .init(id: NSUUID().uuidString, username: "koko", profileImageUrl: "profilephoto", fullname: "Koko Black", bio: "Chocolate Mousse", email: "kokoblack@gmail.com")

    ]
}

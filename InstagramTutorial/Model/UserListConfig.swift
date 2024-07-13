//
//  UserListConfig.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Foundation

// set up an enumeration to display any type of list of user that we want
// eg in explore displaying list of all users
// eg followers, following list of users
// list of users that have liked a particular post etc

enum UserListConfig: Hashable {
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore
    
    var navigationTitle: String {
        switch self {
        case .followers:
            return "Followers"
        case .following:
            return "Following"
        case .likes:
            return "Likes"
        case .explore:
            return "Explore"
        }
    }
}

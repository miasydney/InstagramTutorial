//
//  ProfileViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 12/7/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

// MARK: - Following

extension ProfileViewModel {
    func follow() {
        user.isFollowed = true
    }
    
    func unfollow() {
        user.isFollowed = false
    }
    
    func checkIfUserIsFollowed() {
        
    }
}

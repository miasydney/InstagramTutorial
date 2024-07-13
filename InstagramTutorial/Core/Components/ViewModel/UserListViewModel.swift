//
//  UserListViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        print("DEBUG: Did init...")
    }
    
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("DEBUG: Failed to fetch users with error \(error.localizedDescription)")
        }
    }
    
}

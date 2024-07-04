//
//  AuthService.swift
//  InstagramTutorial
//
//  Created by Mia on 3/7/2024.
//

import Foundation
import FirebaseAuth

// contains all functions related to authenticating user and communicating with API

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String,password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
    
}

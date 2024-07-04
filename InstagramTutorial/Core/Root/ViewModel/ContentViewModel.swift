//
//  ContentViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 4/7/2024.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setUpSubscribers()
    }
    
    func setUpSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}

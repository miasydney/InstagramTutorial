//
//  ContentView.swift
//  InstagramTutorial
//
//  Created by Mia on 1/7/2024.
//

import SwiftUI

@MainActor
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                // no logged in user, show login view
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                // show main tab view
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}

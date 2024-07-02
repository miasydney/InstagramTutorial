//
//  AddEmailView.swift
//  InstagramTutorial
//
//  Created by Mia on 2/7/2024.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10, antialiased: true)
                .padding(.horizontal, 24)
                .padding(.top)
            
            Button {
                print("Login")
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

#Preview {
    AddEmailView()
}

//
//  NotificationCell.swift
//  InstagramTutorial
//
//  Created by Mia on 13/7/2024.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView(size: .xSmall)
            
            // Nofitication message
            HStack {
               Text("yuki")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text(" liked one of your posts.")
                    .font(.subheadline) +
                
                Text(" 3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            
            Spacer()
            
            Image("tenniscourt")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .padding(.leading, 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}

//
//  UserStatView.swift
//  InstagramTutorial
//
//  Created by Mia on 1/7/2024.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .opacity(value == 0 ? 0.5 : 1.0)
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 3, title: "Posts")
}

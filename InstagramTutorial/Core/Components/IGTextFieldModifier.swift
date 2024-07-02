//
//  IGTextFieldModifier.swift
//  InstagramTutorial
//
//  Created by Mia on 2/7/2024.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10, antialiased: true)
            .padding(.horizontal, 24)
    }
}

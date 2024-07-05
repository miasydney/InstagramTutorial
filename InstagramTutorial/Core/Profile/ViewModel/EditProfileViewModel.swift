//
//  EditProfileViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 6/7/2024.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return } // get the image data from the photo picker item
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}

//
//  UploadPostViewModel.swift
//  InstagramTutorial
//
//  Created by Mia on 3/7/2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return } // get the image data from the photo picker item
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return } // make sure someone is logged in and we have their uid
        guard let uiImage = uiImage else { return } // make sure we have an image before we upload a post
        
        let postRef = FirebaseConstants.PostsCollection.document() // firebase generates a document identifier
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }         // upload image
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())         // upload post
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}

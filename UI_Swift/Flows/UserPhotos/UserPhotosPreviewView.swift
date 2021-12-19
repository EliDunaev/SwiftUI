//
//  UserPhotosPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 08.12.2021.
//

import SwiftUI
import ASCollectionView_SwiftUI
import RealmSwift
import Kingfisher

struct UserPhotosPreviewView: View {
    
    @ObservedObject var viewModel: UserPhotosViewModel
    
    @ObservedResults(PhotoModel.self) var photos
    
    var body: some View {
        ASCollectionView(data: photos, dataID: \.url) { photo, _ in
            if photo.id == self.viewModel.userID {
                PhotoCell(photos: photo)
                PhotoGalleryFooter(photoFooterData: photo)
            }
        }
        .layout {
            ASCollectionLayoutSection.grid(
                layoutMode: .adaptive(withMinItemSize: 120),
                itemSpacing: 1,
                lineSpacing: 1
            )
        }
        .navigationTitle("Фото Альбом")
        .onAppear(perform: self.viewModel.getPhotoData)
    }
    
}

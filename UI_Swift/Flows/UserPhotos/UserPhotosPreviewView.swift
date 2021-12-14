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
        ASCollectionView(data: photos) { photo, context in
            KFImage(URL(string: photo.url!))
                .resizable()
                .cancelOnDisappear(true)
                .frame(width: 83, height: 83)
        }.layout {
            ASCollectionLayoutSection.grid(
                layoutMode: .fixedNumberOfColumns(4),
                itemSpacing: 3,
                lineSpacing: 3
            )
        }
        .onAppear(perform: self.viewModel.getPhotoData)
    }
}

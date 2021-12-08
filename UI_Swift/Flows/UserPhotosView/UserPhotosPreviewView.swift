//
//  UserPhotosPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 08.12.2021.
//

import SwiftUI
import ASCollectionView

struct UserPhotosPreviewView: View {
    
    @State var userPhotos: [Photo] = [
        Photo(photo: "avataaars"),
        Photo(photo: "avataaars-2"),
        Photo(photo: "avataaars-3"),
        Photo(photo: "avataaars-4"),
        Photo(photo: "avataaars-5"),
        Photo(photo: "avataaars-6"),
        Photo(photo: "avataaars-7"),
        Photo(photo: "avataaars-8"),
        Photo(photo: "avataaars-9"),
        Photo(photo: "avataaars-10"),
        Photo(photo: "avataaars-11"),
        Photo(photo: "avataaars-12"),
        Photo(photo: "avataaars-13"),
        Photo(photo: "avataaars-14"),
        Photo(photo: "avataaars-15"),
    ]
    
    var body: some View {
        ASCollectionView(data: userPhotos) { photos, context in
            UserPhotosCell(photos: photos)
        }.layout {
            ASCollectionLayoutSection.grid(
                layoutMode: .fixedNumberOfColumns(3),
                itemSpacing: 0,
                lineSpacing: 16
            )
        }
    }
}

struct UserPhotosPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotosPreviewView()
    }
}

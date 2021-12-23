//
//  PhotoCell.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 18.12.2021.
//

import SwiftUI
import Kingfisher

struct PhotoCell: View {
    
    var photos: PhotoModel
    
    var body: some View {
        if photos.url == nil {
            KFImage(URL(string: "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg"))
                .resizable()
                .setProcessor(ResizingImageProcessor(referenceSize: CGSize(width: 500 , height: 500), mode: .aspectFit))
                .cancelOnDisappear(true)

        } else {
            KFImage(URL(string: photos.url!))
                .resizable()
                .setProcessor(ResizingImageProcessor(referenceSize: CGSize(width: 500 , height: 500), mode: .aspectFit))
                .cancelOnDisappear(true)
        }
    }
}

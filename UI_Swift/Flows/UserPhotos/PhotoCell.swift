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
            GeometryReader { proxy in
                KFImage(URL(string: "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg"))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: proxy.size.width)
                    .aspectRatio(2, contentMode: .fill)
                    .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width)
            }
        } else {
            GeometryReader { proxy in
                KFImage(URL(string: photos.url!))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: proxy.size.width)
                    .aspectRatio(2, contentMode: .fill)
                    .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width)
            }
        }
    }
}

struct PhotoHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

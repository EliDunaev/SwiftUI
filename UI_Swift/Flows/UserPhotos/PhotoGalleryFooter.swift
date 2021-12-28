//
//  PhotoGalleryFooter.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 18.12.2021.
//

import SwiftUI

struct PhotoGalleryFooter: View {
    
    @ObservedObject var viewModel: UserPhotosViewModel
    
    @State private var isLike = false
    
    var photoFooterData: PhotoModel
    let apiService: APIRequest
    
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .center) {
                if self.photoFooterData.userLikes == 0 {
                    Image(systemName: "hand.thumbsup")
                        .rotationEffect(Angle.degrees(isLike ? 45 : 0))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isLike)
                        .highPriorityGesture (
                            TapGesture()
                                .onEnded{ _ in
                                    if self.photoFooterData.userLikes == 0 {
                                        self.apiService.likeAdd(itemId: self.photoFooterData.photoId, ownerId: self.photoFooterData.ownerId)
                                    } else {
                                        self.apiService.likeDelete(itemId: self.photoFooterData.photoId, ownerId: self.photoFooterData.ownerId)
                                    }
                                    self.isLike = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.viewModel.getPhotoData()
                                        isLike = false
                                    }
                                }
                        )
                        .preference(key: FooterHeightPreferenceKey.self, value: proxy.size.width)
                } else {
                    Image(systemName: "hand.thumbsup.fill")
                        .rotationEffect(Angle.degrees(isLike ? 45 : 0))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isLike)
                        .highPriorityGesture (
                            TapGesture()
                                .onEnded{ _ in
                                    if self.photoFooterData.userLikes == 0 {
                                        self.apiService.likeAdd(itemId: self.photoFooterData.photoId, ownerId: self.photoFooterData.ownerId)
                                    } else {
                                        self.apiService.likeDelete(itemId: self.photoFooterData.photoId, ownerId: self.photoFooterData.ownerId)
                                    }
                                    self.isLike = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.viewModel.getPhotoData()
                                        isLike = false
                                    }
                                }
                        )
                        .preference(key: FooterHeightPreferenceKey.self, value: proxy.size.width)
                }
                Text(String(photoFooterData.likes))
            }
        }
    }
}

struct FooterHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

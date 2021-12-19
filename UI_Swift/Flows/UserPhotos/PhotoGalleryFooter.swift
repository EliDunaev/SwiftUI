//
//  PhotoGalleryFooter.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 18.12.2021.
//

import SwiftUI

struct PhotoGalleryFooter: View {
    
    @State private var isLike = false
    @State private var testLikes = 0
    @State private var isUserLike = false
    @State private var likeImage = "hand.thumbsup"
    
    var photoFooterData: PhotoModel
    
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: likeImage)
                .rotationEffect(Angle.degrees(isLike ? 45 : 0))
                .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isLike)
                .highPriorityGesture (
                    DragGesture(minimumDistance: 0, coordinateSpace: .global)
                        .onChanged {_ in
                            self.isLike.toggle()
                            if !isUserLike {
                                self.testLikes += 1
                                self.isUserLike = true
                                self.likeImage = "hand.thumbsup.fill"
                            } else {
                                self.testLikes -= 1
                                self.isUserLike = false
                                self.likeImage = "hand.thumbsup"
                            }
                        }
                        .onEnded{ _ in
                            self.isLike.toggle()
                        }
                )
            Text("\(self.testLikes)") //Тестовая модель лайков
//            Text(String(photoFooterData.likes))
        }
    }
}

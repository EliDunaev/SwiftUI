//
//  AnimationModifiers.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 19.12.2021.
//

import Foundation
import SwiftUI

extension View {
    func userAvatarAnimationStyle() -> some View {
        self.modifier(UserAvatarAnimationModifier())
    }
    
    func likeAnimationStyle() -> some View {
        self.modifier(LikeAnimationModifier())
    }
}


struct UserAvatarAnimationModifier: ViewModifier {
    @State private var isBounce = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isBounce ? 1.1 : 1)
            .animation(.interpolatingSpring(stiffness: 2000, damping: 100), value: isBounce)
            .highPriorityGesture (
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged {_ in
                        self.isBounce.toggle()
                    }
                    .onEnded{ _ in
                        self.isBounce.toggle()
                    }
            )
    }
}

struct LikeAnimationModifier: ViewModifier {
    @State private var isLike = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle.degrees(isLike ? 45 : 0))
            .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isLike)
            .highPriorityGesture (
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged {_ in
                        self.isLike.toggle()
                    }
                    .onEnded{ _ in
                        self.isLike.toggle()
                    }
            )
    }
}

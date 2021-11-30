//
//  GroupPreviewModifiers.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

extension View {
    func groupAvatarStyle() -> some View {
        self.modifier(GroupAvatarModifier())
    }
    
    func groupNameStyle() -> some View {
        self.modifier(GroupNameTextModifier())
    }
    
    func groupDescriptionStyle() -> some View {
        self.modifier(GroupDescriptionTextModifier())
    }
}

struct GroupAvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .frame(width: 60, height: 60)
            .shadow(color: Color.black, radius: 5, x: 0, y: 0)
    }
}

struct GroupNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
    }
}

struct GroupDescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.gray)
            .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
    }
}

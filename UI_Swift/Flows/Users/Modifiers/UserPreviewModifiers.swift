//
//  UserPreviewModifiers.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

extension View {
    func userAvatarStyle() -> some View {
        self.modifier(UserAvatarModifier())
    }
    
    func userNameStyle() -> some View {
        self.modifier(UserNameTextModifier())
    }
    
    func userOnlineStyle() -> some View {
        self.modifier(UserOnlineStatusModifier())
    }
    
    func userOfflineStyle() -> some View {
        self.modifier(UserOfflineStatusModifier())
    }
    
    func userOfflineTextStyle() -> some View {
        self.modifier(UserOfflineTextModifier())
    }
}

struct UserNameTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
    }
}

struct UserAvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .frame(width: 60, height: 60)
            .shadow(color: Color.black, radius: 5, x: 0, y: 0)
    }
}

struct UserOnlineStatusModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .frame(width: 5, height: 5)
            .shadow(color: .blue, radius: 5, x: 0, y: 0)
            .padding(.trailing, 5)
    }
}

struct UserOfflineStatusModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .frame(width: 5, height: 5)
            .shadow(color: .gray, radius: 5, x: 0, y: 0)
            .padding(.trailing, 5)
    }
}

struct UserOfflineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.gray)
            .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
        
    }
}

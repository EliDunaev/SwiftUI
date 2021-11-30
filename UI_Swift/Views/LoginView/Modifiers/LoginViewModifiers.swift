//
//  LoginViewModifiers.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

extension View {
    func textFieldStyle() -> some View {
        self.modifier(TextFieldViewModifier())
    }
    
    func textStyle() -> some View {
        self.modifier(TextViewModifier())
    }
    
    func logoStyle() -> some View {
        self.modifier(LogoViewModifier())
    }
    
    
    func vStackStyle() -> some View {
        self.modifier(VStackViewModifier())
    }
    
    func buttonStyle() -> some View {
        self.modifier(ButtonViewModifier())
    }
}

struct TextFieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 120)
            .shadow(color: .green, radius: 2.5, x: 0, y: 0)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct TextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .shadow(color: .blue, radius: 15, x: 0, y: 0)
    }
}

struct LogoViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .shadow(color: .green, radius: 5, x: 0, y: 0)
            .padding()
    }
}

struct VStackViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 250)
            .padding()
            .background(Color.black.opacity(0.6))
            .cornerRadius(10)
    }
}

struct ButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 100)
            .background(Color.gray.opacity(0.5))
            .foregroundColor(.white)
            .shadow(color: .blue, radius: 5, x: 0, y: 0)
            .cornerRadius(5)
    }
}

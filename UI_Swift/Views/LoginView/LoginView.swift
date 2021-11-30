//
//  LoginView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 26.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    
    @State private var showMainScreen = false
    
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("Background")
                    .resizable()
                    .scaledToFill()
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        Text("VK Mobile")
                            .logoStyle()
                        Divider()
                        HStack {
                            Text("Login:")
                                .font(.title)
                                .textStyle()
                            Spacer()
                            TextField("", text: $login)
                                .textFieldStyle()
                        }
                        Divider()
                        HStack {
                            Text("Password:")
                                .textStyle()
                            Spacer()
                            SecureField("", text: $password)
                                .textFieldStyle()
                        }
                    }.vStackStyle()
                        .fullScreenCover(isPresented: $showMainScreen) {
                            UserPreviewView()
                        }
                    Button(action: showHomeScreen) {
                        Text("Log in")
                            .buttonStyle()
                    }.padding(.top, 25)
                        .padding(.bottom, 20)
                        .disabled(login.isEmpty || password.isEmpty)
                }.padding(.top, 50)
            }
        }
    }
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    func showHomeScreen() {
        showMainScreen.toggle()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  LoginView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 26.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State private var login = ""
    @State private var password = ""
    @AppStorage("vkToken") var token: String?
    
    @State private var showIncorrentCredentialsWarning = false
    
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
                        .alert(isPresented: $showIncorrentCredentialsWarning, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
                        })
                    Button(action: verifyLoginData) {
                        Text("Log in")
                            .buttonStyle()
                    }
                    .animation(.spring(), value: 45)
                    .padding(.top, 25)
                    .padding(.bottom, 20)
                }
                .padding(.top, 50)
            }
        }
        .navigationBarHidden(true)
    }
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    private func verifyLoginData() {
        if login == "1" && password == "1" && token != nil {
            self.viewModel.isUserLoggedIn = true
        } else {
//            showIncorrentCredentialsWarning = true
            self.viewModel.isUserLoggedIn = false
        }
        password = ""
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

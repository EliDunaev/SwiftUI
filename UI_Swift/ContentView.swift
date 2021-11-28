//
//  ContentView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 26.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    
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
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .shadow(color: .green, radius: 5, x: 0, y: 0)
                            .padding()
                        Divider()
                        HStack {
                            Text("Login:")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(color: .blue, radius: 15, x: 0, y: 0)
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .shadow(color: .green, radius: 2.5, x: 0, y: 0)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        Divider()
                        HStack {
                            Text("Password:")
                                .foregroundColor(.white)
                                .shadow(color: .blue, radius: 15, x: 0, y: 0)
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150)
                                .shadow(color: .green, radius: 2.5, x: 0, y: 0)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                    }.frame(maxWidth: 250)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                    Button(action: { print("Hello") }) {
                        Text("Log in")
                            .frame(maxWidth: 100)
                            .background(Color.gray.opacity(0.5))
                            .foregroundColor(.white)
                            .shadow(color: .blue, radius: 5, x: 0, y: 0)
                            .cornerRadius(5)
                        
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
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

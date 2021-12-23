//
//  UserPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Kingfisher
import CoreGraphics
import UIKit

struct UserPreviewView: View {
    
    @State private var showLoginScreen = false
    
    @ObservedObject var viewModel: UserViewModel
    @ObservedObject var loginModel: LoginViewModel
    
    @ObservedResults(UserModel.self) var friends
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { user in
                    NavigationLink(destination: UserPhotosPreviewView(
                        viewModel: UserPhotosViewModel(
                            apiService: APIRequest(),
                            realmStorage: PhotoDatabaseService(),
                            userID: user.id!
                        ))) {
                            HStack {
                                if user.online == 1 {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .userOnlineStyle()
                                } else {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .userOfflineStyle()
                                }
                                
                                UserAvatarView(userPhotos: user)
                                
                                VStack(alignment: .leading) {
                                    Text(user.firstName! + " " + user.lastName!)
                                        .userNameStyle()
                                    if user.online == 0 {
                                        Text("Был в сети... ")
                                            .userOfflineTextStyle()
                                    }
                                }
                            }
                        }
                }
            }
            .onAppear(perform: self.viewModel.getFriendsData)
            .listStyle(GroupedListStyle())
            .navigationTitle("Список друзей")
            
            // Кнопку пока убрал, так как для этого нужно на координатор перевести Пользователей. Как я понимаю повторная попытка входа с экрана логина вызывает вторую сущность MainTabCoordtinator, и это ведёт к конфликту/ Если верить ошибке компилятора...
            
//            .fullScreenCover(isPresented: $showLoginScreen) {
//                LoginView(viewModel: loginModel)
//            }
//            .navigationBarItems(trailing:
//            Button(action: { showLoginView() })
//            { Text("Log Out") })
        }
        .navigationBarHidden(true)
    }
    
    func showLoginView() {
        showLoginScreen.toggle()
    }
    
}

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

struct UserPreviewView: View {
    
    @State private var showLoginScreen = false
    
    @ObservedObject var viewModel: UserViewModel
    
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
                            
                            KFImage(URL(string: user.photo100!)!)
                                .cancelOnDisappear(true)
                                .resizable()
                                .userAvatarStyle()
                            
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
            .fullScreenCover(isPresented: $showLoginScreen) {
                LoginView()
            }
            .navigationTitle("Список друзей")
            .navigationBarItems(trailing: Button(action: {
                showLoginView()
            })
                                {Text("Log Out")}
            )
        }
        .navigationBarHidden(true)
    }
    
    func showLoginView() {
        showLoginScreen.toggle()
    }
}

//struct UserPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserPreviewView()
//    }
//}

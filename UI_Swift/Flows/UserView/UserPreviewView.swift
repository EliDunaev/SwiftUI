//
//  UserPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

struct UserPreviewView: View {
    
    @StateObject var friendsModel = FriendsModel()
    @State var searchTerm = ""
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarPreviewView(searchTerm: $searchTerm)
                List {
                    ForEach(friendsModel.sectionDictionary.keys.sorted(), id:\.self) { key in
                        if let friends = friendsModel.sectionDictionary[key]!.filter({
                            (friend) -> Bool in
                            self.searchTerm.isEmpty ? true :
                            "\(friend)".lowercased().contains(self.searchTerm.lowercased())}),
                            !friends.isEmpty
                        {
                            Section(header: Text("\(key)")) {
                                ForEach(friends){ user in
                                    NavigationLink(destination: UserPhotosPreviewView()) {
                                        HStack {
                                            if user.onlineStatus {
                                                Image(systemName: "circle.fill")
                                                    .resizable()
                                                    .userOnlineStyle()
                                            } else {
                                                Image(systemName: "circle.fill")
                                                    .resizable()
                                                    .userOfflineStyle()
                                            }
                                            UserAvatarImage {
                                                Image(user.userAvatar)
                                            }
                                            VStack(alignment: .leading) {
                                                Text(user.name + " " + user.surname)
                                                    .userNameStyle()
                                                if !user.onlineStatus {
                                                    Text("Был в сети недавно")
                                                        .userOfflineTextStyle()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
        }
        .navigationBarHidden(true)
    }
    
    func showLoginView() {
        showLoginScreen.toggle()
    }
}

struct UserPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserPreviewView()
    }
}

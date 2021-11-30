//
//  UserPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

struct UserPreviewView: View {
    
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(userData) { user in
                    NavigationLink(destination: GroupPreviewView()) {
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
                        .fullScreenCover(isPresented: $showLoginScreen) {
                            LoginView()
                        }
                    }
                }
            }.navigationTitle("Список друзей")
                .navigationBarItems(trailing:
                                        Button(action: {
                    showLoginView()
                }) {
                    Text("Log Out")
                }
                )
        }
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

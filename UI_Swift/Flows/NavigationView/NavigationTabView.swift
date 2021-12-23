//
//  NavigationTabView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 06.12.2021.
//

import Foundation
import SwiftUI

struct NavigationTabView: View {
    
    @ObservedObject var viewModel: NavigationMainTabModel
//
//    let tabCoordinator: MainTabBarCoordinator
    
//    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: self.$viewModel.tabSelection) {
            NavigationView {
//                UserPreviewView(viewModel: UserViewModel(
//                    apiService: APIRequest(),
//                    realmStorage: UsersDatabaseService()
//                ))
            }
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Друзья")
            }
            .tag(0)
            
            NavigationView {
//                GroupPreviewView(viewModel: GroupViewModel(
//                    apiService: APIRequest(),
//                    realmStorage: GroupsDatabaseService()))
            }
            .tabItem {
                Image(systemName: "person.2.crop.square.stack.fill")
                Text("Группы")
            }
            .tag(1)
            
            NavigationView {
//                NewsPreviewView(viewModel: NewsViewModel(
//                    apiService: APIRequest(),
//                    realmStorage: NewsDatabaseService(),
//                    realmNewsGroups: NewsGroupsDatabaseService()
//                ))
            }
            .tabItem {
                Image(systemName: "newspaper.fill")
                Text("Новости")
            }
            .tag(2)
        }
    }
}

//
//  NavigationTabView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 06.12.2021.
//

import Foundation
import SwiftUI

struct NavigationTabView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                UserPreviewView()
            }
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Друзья")
            }
            .tag(0)
            
            NavigationView {
                GroupPreviewView()
            }
            .tabItem {
                Image(systemName: "person.2.crop.square.stack.fill")
                Text("Группы")
            }
            .tag(1)
            
            NavigationView {
                NewsPreviewView()
            }
            .tabItem {
                Image(systemName: "newspaper.fill")
                Text("Новости")
            }
            .tag(2)
        }
    }
}

struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabView()
    }
}

//
//  GroupPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Kingfisher

struct GroupPreviewView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    @ObservedResults(GroupsModel.self) var groups
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groups) { group in
                    HStack {
                        KFImage(URL(string: group.photo50!))
                            .groupAvatarStyle()
                        VStack(alignment: .leading) {
                            Text(group.name!)
                                .groupNameStyle()
                        }
                    }
                }
            }
            .onAppear(perform: self.viewModel.getGroups)
            .listStyle(GroupedListStyle())
            .navigationTitle("Список групп")
        }
        .navigationBarHidden(true)

    }
}

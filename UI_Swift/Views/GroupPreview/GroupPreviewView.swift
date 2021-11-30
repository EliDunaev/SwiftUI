//
//  GroupPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

struct GroupPreviewView: View {
    
    var body: some View {
        List {
            ForEach(groupData) { group in
                HStack {
                    GroupAvatarImage {
                        Image(group.groupAvatar)
                    }
                    VStack(alignment: .leading) {
                        Text(group.name)
                            .groupNameStyle()
                        Text(group.description)
                            .groupDescriptionStyle()
                    }
                }
            }
        }
    }
}

struct GroupPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPreviewView()
    }
}

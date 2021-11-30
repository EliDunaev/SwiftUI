//
//  GroupViewBuilder.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation
import SwiftUI

struct GroupAvatarImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .groupAvatarStyle()
    }
}

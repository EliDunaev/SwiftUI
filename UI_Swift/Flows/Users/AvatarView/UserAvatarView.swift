//
//  UserAvatarView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 18.12.2021.
//

import SwiftUI
import Kingfisher

struct UserAvatarView: View {
    
    var userPhotos: UserModel
    
    var body: some View {
        KFImage(URL(string: userPhotos.photo100!)!)
            .cancelOnDisappear(true)
            .resizable()
            .userAvatarStyle()
            .userAvatarAnimationStyle()
    }
}



//
//  UserPhotosCell.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 08.12.2021.
//

import SwiftUI

struct UserPhotosCell: View {
    
    let photos: Photo
    
    var body: some View {
        Image(photos.photo)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .shadow(color: .gray, radius: 5, x: 0, y: 0)
    }
}

struct UserPhotosCell_Previews: PreviewProvider {
    
    static let photos = Photo(photo: "avataaars")
    
    static var previews: some View {
        UserPhotosCell(photos: Self.photos)
    }
}

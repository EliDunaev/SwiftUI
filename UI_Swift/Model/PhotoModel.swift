//
//  PhotoModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import DynamicJSON
import RealmSwift

class PhotoModel: Object, Identifiable {
    
    @Persisted var photoId: Int
    @Persisted var ownerId: Int
    @Persisted var url: String?
    @Persisted var userLikes = 0
    @Persisted var likes = 0
    
    convenience required init(data: JSON) {
        self.init()
        
        self.photoId = data.id.int!
        self.ownerId = data.owner_id.int!
        self.url = data["sizes"][7].url.string
        if self.url == nil {
            self.url = data["sizes"][5].url.string
        }
        self.userLikes = data.likes.user_likes.int!
        self.likes = data.likes.count.int!
        
    }
    
    override static func primaryKey() -> String? {
        return "photoId"
    }
}

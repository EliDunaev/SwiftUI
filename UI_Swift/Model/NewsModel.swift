//
//  NewsModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import DynamicJSON
import RealmSwift

class NewsModel: Object, Identifiable {

    @Persisted var sourceId = 0
    @Persisted var postID = 0
    @Persisted var date = 0
    @Persisted var text: String?
    @Persisted var userLikes = 0
    @Persisted var likes = 0
    @Persisted var reposts = 0
    @Persisted var photo: String?
    @Persisted var comments = 0
    @Persisted var views = 0
    
    convenience required init(data: JSON) {
        self.init()
        
        self.postID = data.post_id.int!
        self.date = data.date.int!
        self.sourceId = data.source_id.int!
        if sourceId < 0 {
            self.sourceId.negate()
        }
        self.text = data.text.string
        self.userLikes = data.likes.user_likes.int!
        self.likes = data.likes.count.int!
        self.views = data.views.count.int!
        self.reposts = data.reposts.count.int!
        self.comments = data.comments.count.int!
        self.photo = data["attachments"][0].photo["sizes"][4].url.string
        if self.photo == nil {
            self.photo = "https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg"
        }
    }
    
    override static func primaryKey() -> String? {
        return "postID"
    }
}

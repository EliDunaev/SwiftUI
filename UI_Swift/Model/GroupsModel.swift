//
//  GroupsModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import DynamicJSON
import RealmSwift

class GroupsModel: Object, Identifiable {
    
    @Persisted var id: String?
    @Persisted var name: String?
    @Persisted var photo50: String?
    
    convenience required init(data: JSON) {
        self.init()
        
        self.id = data.id.string
        self.name = data.name.string
        self.photo50 = data.photo_50.string
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

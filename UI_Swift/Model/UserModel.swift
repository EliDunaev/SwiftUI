//
//  UserModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 11.12.2021.
//

import Foundation
import DynamicJSON
import RealmSwift

class UserModel: Object, Identifiable {
    
    @Persisted var id: Int
    @Persisted var sex: Int = 0
    @Persisted var firstName: String?
    @Persisted var bdate: String? = nil
    @Persisted var city: String? = nil
    @Persisted var lastName: String?
    @Persisted var photo100: String?
    @Persisted var photo50: String?
    @Persisted var online: Int = 0
    @Persisted var status: String? = nil
    
    convenience required init(data: JSON) {
        self.init()
        
        self.id = data.id.int!
        self.sex = data.sex.int!
        self.firstName = data.first_name.string
        self.bdate = data.bdate.string
        self.city = data.city.title.string
        self.lastName = data.last_name.string
        self.photo100 = data.photo_100.string
        self.photo50 = data.photo_50.string
        self.online = data.online.int!
        self.status = data.status.string
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}



//class UserModel: Object, Identifiable, Decodable {
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case sex
//        case firstName = "first_name"
//        case bdate
//        case lastName = "last_name"
//        case photo100 = "photo_100"
//        case online
//        case status
//    }
//
//    @Persisted var id: Int = 0
//    @Persisted var sex: Int = 0
//    @Persisted var firstName: String?
//    @Persisted var bdate: String? = nil
//    @Persisted var lastName: String?
//    @Persisted var photo100: String?
//    @Persisted var online: Int = 0
//    @Persisted var status: String? = nil
//
//    override init() {
//        super.init()
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.sex = try container.decode(Int.self, forKey: .sex)
//        self.firstName = try container.decode(String.self, forKey: .firstName)
//        self.bdate = try container.decode(String.self, forKey: .bdate)
//        self.lastName = try container.decode(String.self, forKey: .lastName)
//        self.photo100 = try container.decode(String.self, forKey: .photo100)
//        self.online = try container.decode(Int.self, forKey: .online)
//        self.status = try container.decode(String.self, forKey: .status)
//    }
//
//    override class func primaryKey() -> String? {
//        return "id"
//    }
//}
//
//class Items: Object, Decodable {
//    @Persisted var id: Int
//    @Persisted var sex: Int
//    @Persisted var firstName: String
//    @Persisted var bdate: String
//    @Persisted var lastName: String
//    @Persisted var photo100: String
//    @Persisted var online: Int
//    @Persisted var status: String
//}
//
//struct FriendsResponse: Decodable {
//    var response: [UserModel]
//}

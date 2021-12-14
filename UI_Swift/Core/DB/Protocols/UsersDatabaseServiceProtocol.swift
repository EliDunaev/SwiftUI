//
//  UsersDatabaseServiceProtocol.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import RealmSwift

protocol UsersDatabaseServiceProtocol {
    func add(user: [UserModel])
    func read() -> [UserModel]
    func delete(user: UserModel)
    func readResults() -> Results<UserModel>?
}

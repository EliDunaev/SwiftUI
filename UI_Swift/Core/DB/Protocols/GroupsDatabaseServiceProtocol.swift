//
//  GroupsDatabaseServiceProtocol.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import RealmSwift

protocol GroupsDatabaseServiceProtocol {
    func add(groups: [GroupsModel])
    func read() -> [GroupsModel]
    func delete(groups: GroupsModel)
    func readResults() -> Results<GroupsModel>?
}

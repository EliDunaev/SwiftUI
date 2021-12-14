//
//  NewsGroupsDatabaseServiceProtocol.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import RealmSwift

protocol NewsGroupsDatabaseServiceProtocol {
    func add(newsGroups: [NewsGroupsModel])
    func read() -> [NewsGroupsModel]
    func readById(id: Int) -> [NewsGroupsModel]
    func delete(newsGroups: NewsGroupsModel)
    func readResults() -> Results<NewsGroupsModel>?
}

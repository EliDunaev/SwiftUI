//
//  NewsDatabaseServiceProtocol.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import RealmSwift

protocol NewsDatabaseServiceProtocol {
    func add(news: [NewsModel])
    func read() -> [NewsModel]
    func getID(id: Int) -> [NewsModel]
    func delete(news: NewsModel)
    func readResults() -> Results<NewsModel>?
}

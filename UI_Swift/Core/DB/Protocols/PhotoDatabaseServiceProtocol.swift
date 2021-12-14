//
//  PhotoDatabaseServiceProtocol.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import RealmSwift

protocol PhotoDatabaseServiceProtocol {
    func add(photos: [PhotoModel])
    func read(userID: String) -> [PhotoModel]
    func delete(photo: PhotoModel)
    func readResults(userID: String) -> Results<PhotoModel>?
}

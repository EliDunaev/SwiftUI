//
//  NewsGroupsDatabaseService.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import RealmSwift

class NewsGroupsDatabaseService: NewsGroupsDatabaseServiceProtocol {
    
    let config = Realm.Configuration(schemaVersion: 1)
    lazy var realm = try! Realm(configuration: config)
    
    func add(newsGroups: [NewsGroupsModel]) {
        
        do {
            self.realm.beginWrite()
            self.realm.add(newsGroups, update: .modified)
            try self.realm.commitWrite()
            print(realm.configuration.fileURL as Any)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read() -> [NewsGroupsModel] {
        let newsGroups = self.realm.objects(NewsGroupsModel.self)
        return Array(newsGroups)
    }
    
    func readById(id: Int) -> [NewsGroupsModel] {
        let newsGroupsById = self.realm.objects(NewsGroupsModel.self).filter("id = '\(id)'")
        return Array(newsGroupsById)
    }
    
    func readResults() -> Results<NewsGroupsModel>? {
        let groupsResults = self.realm.objects(NewsGroupsModel.self)
        return groupsResults
    }
    
    func delete(newsGroups: NewsGroupsModel) {
        
        do {
            self.realm.beginWrite()
            self.realm.delete(newsGroups)
            try self.realm.commitWrite()
            print(realm.configuration.fileURL as Any)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

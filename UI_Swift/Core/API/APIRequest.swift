//
//  APIRequest.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import Alamofire
import DynamicJSON
import PromiseKit

final class APIRequest {
    
    let baseUrl = "https://api.vk.com/method"
    let token = UserDefaults.standard.getVkToken()
    let cliendId = UserDefaults.standard.getUserID()
    let version = "5.131"
    
    //    MARK: - DB SERVICES
    let userDB = UsersDatabaseService()
    let photosDB = PhotoDatabaseService()
    let groupsDB = GroupsDatabaseService()
    let newsGroupsDB = NewsGroupsDatabaseService()
    let newsDB = NewsDatabaseService()
    
    //    MARK: - GET USER FRIENDS
    func getFriends() {
        
        let operation = OperationQueue()
        
        let method = "/friends.get"
        let parameters: Parameters = [
            "user_id": cliendId,
            "order": "name",
            "fields": "sex,bdate,city,photo_100,photo_50,online,status",
            "access_token": token,
            "v": version]
        let url = baseUrl + method
        
        let request = AF.request(url, method: .get, parameters: parameters)
        print(request as Any)
        
        let getDataOperation = GetDataOperation(request: request)
        operation.addOperation(getDataOperation)
        
        let parseData = ParseData()
        parseData.addDependency(getDataOperation)
        operation.addOperation(parseData)
        
        let reloadTableController = LoadFriendsToRealm()
        reloadTableController.addDependency(parseData)
        OperationQueue.main.addOperation(reloadTableController)
    }
    
    //    MARK: - GET USER PHOTOS
    func getPhoto(userID: Int) {
        
        let method = "/photos.getAll"
        let parameters: Parameters = [
            "owner_id": userID,
            "photo_sizes": 1,
            "count": 20,
            "extended": 1,
            "no_service_albums": 1,
            "access_token": token,
            "v": version]
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            print(response.request as Any)
            
            guard let data = response.data else { return }
            guard let items = JSON(data).response.items.array else { return }
            
            print(items)
            
            let url: [PhotoModel] = items.map { PhotoModel(data: $0) }
            
            DispatchQueue.main.async {
                self.photosDB.add(photos: url)
            }
        }
    }
    
    //    MARK: - GET USER GROUPS
    func getGroups() {
        
        let method = "/groups.get"
        let parameters: Parameters = [
            "user_id": cliendId,
            "order": "name",
            "extended": 1,
            "access_token": token,
            "v": "5.124"]
        let url = baseUrl + method
        print("#URL \(url)")
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            print(response.request as Any)
            
            guard let data = response.data else { return }
            guard let items = JSON(data).response.items.array else { return }
            
            print("# \(items)")
            
            let groups: [GroupsModel] = items.map { GroupsModel(data: $0) }
            DispatchQueue.main.async {
                self.groupsDB.add(groups: groups)
            }
        }
    }
    
    //    MARK: - GET NEWS
    func getNews() {
        
        let method = "/newsfeed.get"
        let parameters: Parameters = [
            "filters": "post, photo",
            "count": 60,
            "access_token": token,
            "v": version]
        let url = baseUrl + method
        
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            print("# \(response.request as Any)")
            
            guard let data = response.data else { return }
            
            let itemsQueue = DispatchQueue(label: "ItemsParsing",
                                           qos: .userInitiated,
                                           attributes: .concurrent)
            let groupsQueue = DispatchQueue(label: "GroupsParsing",
                                            qos: .userInitiated,
                                            attributes: .concurrent)
            
            itemsQueue.async {
                print("1 Parsing items")
                guard let itemsNews = JSON(data).response.items.array else { return }
                let news: [NewsModel] = itemsNews.map { NewsModel(data: $0) }
                print("news")
                print(news)
                DispatchQueue.main.async {
                    print("1.1 Write items data to DB")
                    self.newsDB.add(news: news)
                }
            }
            
            groupsQueue.async {
                print("1 Parsing groups")
                guard let itemsGroups = JSON(data).response.groups.array else { return }
                let groups: [NewsGroupsModel] = itemsGroups.map { NewsGroupsModel(data: $0) }
                DispatchQueue.main.async {
                    print("1.1 Write groups data to DB")
                    self.newsGroupsDB.add(newsGroups: groups)
                }
                
            }
        }
    }
    
    //    MARK: - LIKE ADD & DELETE
    func likeAdd(itemId: Int, ownerId: Int) {
        let method = "/likes.add"
        let parameters: Parameters = [
            "type": "photo",
            "owner_id": ownerId,
            "item_id": itemId,
            "access_token": token,
            "v": version]
        let url = baseUrl + method
        
        AF.request(url, method: .post, parameters: parameters).responseData { response in
            print("# \(response as Any)")
        }
    }
    
    func likeDelete(itemId: Int, ownerId: Int) {
        let method = "/likes.delete"
        let parameters: Parameters = [
            "type": "photo",
            "owner_id": ownerId,
            "item_id": itemId,
            "access_token": token,
            "v": version]
        let url = baseUrl + method
        
        AF.request(url, method: .post, parameters: parameters).responseData { response in
            print("# \(response as Any)")
        }
    }
}

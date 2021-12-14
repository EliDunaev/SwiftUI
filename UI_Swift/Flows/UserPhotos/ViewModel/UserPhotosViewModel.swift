//
//  UserPhotosViewModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import Combine
import PromiseKit
import RealmSwift

class UserPhotosViewModel: ObservableObject {
    
    var userID: String
    
    private let apiService: APIRequest
    private let realmStorage: PhotoDatabaseService
    
    @Published private(set) var photos: [PhotoModel] = []
    
    init(apiService: APIRequest, realmStorage: PhotoDatabaseService, userID: String) {
        self.userID = userID
        self.apiService = apiService
        self.realmStorage = realmStorage
    }
    
    func getPhotoData() {
        self.apiService.getPhoto(userID: self.userID)
    }
}

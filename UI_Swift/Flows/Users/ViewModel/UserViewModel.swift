//
//  UserViewModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 11.12.2021.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    private let apiService: APIRequest
    private let realmStorage: UsersDatabaseService
    
    @Published private(set) var friends: [UserModel] = []
    
    init(apiService: APIRequest, realmStorage: UsersDatabaseService) {
        self.apiService = apiService
        self.realmStorage = realmStorage
    }
    
    func getFriendsData() {
        self.apiService.getFriends()
    }
}

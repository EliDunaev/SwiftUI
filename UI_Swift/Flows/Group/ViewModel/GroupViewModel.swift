//
//  GroupViewModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation
import Combine

class GroupViewModel: ObservableObject {
    
    private let apiService: APIRequest
    private let realmStorage: GroupsDatabaseService
    
    @Published private(set) var groups: [GroupsModel] = []
    
    init(apiService: APIRequest, realmStorage: GroupsDatabaseService) {
        self.apiService = apiService
        self.realmStorage = realmStorage
    }
    
    func getGroups() {
        self.apiService.getGroups()
    }
}

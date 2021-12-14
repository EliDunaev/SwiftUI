//
//  NewsViewModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    private let apiService: APIRequest
    private let realmStorage: NewsDatabaseService
    private let realmNewsGroups: NewsGroupsDatabaseService
    
    @Published private(set) var news: [NewsModel] = []
    @Published private(set) var newsGroups: [NewsGroupsModel] = []
    
    init(apiService: APIRequest,
         realmStorage: NewsDatabaseService,
         realmNewsGroups: NewsGroupsDatabaseService) {
        self.apiService = apiService
        self.realmStorage = realmStorage
        self.realmNewsGroups = realmNewsGroups
    }
    
    func getNews() {
        self.apiService.getNews()
    }
}

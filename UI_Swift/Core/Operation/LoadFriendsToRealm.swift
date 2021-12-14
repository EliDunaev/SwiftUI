//
//  LoadFriendsToRealm.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation

class LoadFriendsToRealm: Operation {
    var userDB = UsersDatabaseService()
    
    override func main() {
        guard let parseData = dependencies.first as? ParseData else { return }
        self.userDB.add(user: parseData.friendsData)
        print("Load to DB finished")
  }
}

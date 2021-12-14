//
//  ParseData.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 12.12.2021.
//

import Foundation
import Alamofire
import DynamicJSON

class ParseData: Operation {

    var friendsData: [UserModel] = []
    
    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
            let data = getDataOperation.data else { return }
        guard let items = JSON(data).response.items.array else { return }
        let friends: [UserModel] = items.map { UserModel(data: $0) }
        friendsData = friends
        print("Parse Finished")
    }
}

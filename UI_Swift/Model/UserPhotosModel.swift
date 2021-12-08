//
//  UserPhotosModel.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 08.12.2021.
//

import Foundation

class Photo: Identifiable {
    internal init(photo: String) {
       self.photo = photo
   }
  
   let id: UUID = UUID()
    let photo: String
}

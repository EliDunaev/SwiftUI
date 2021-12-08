//
//  Group.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation

struct Group: Identifiable {
    let id: Int
    let groupAvatar: String
    let name: String
    let description: String
}

let groupData = [
    Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"),
    Group(id: 1, groupAvatar: "music", name: "Музыка",description: "Группа о музыке"),
    Group(id: 2, groupAvatar: "games", name: "Игры", description: "Группа о играх"),
    Group(id: 3, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),
    Group(id: 4, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах"),
    Group(id: 5, groupAvatar: "meme", name: "Мемасики", description: "Группа о мемасиках"),
]

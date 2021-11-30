//
//  User.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation

struct User: Identifiable{
    var id: Int
    var name: String
    var onlineStatus: Bool
    var userAvatar: String
    var surname: String
    var groups: [Group]
}

let userData = [
    User(id: 0, name: "Василий", onlineStatus: true, userAvatar: "Avatar", surname: "Петров", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 2, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")]),
    User(id: 1, name: "Всеволод", onlineStatus: false, userAvatar: "Avatar", surname: "Иванов", groups: [Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 2, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")]),
    User(id: 2, name: "Иван", onlineStatus: true, userAvatar: "Avatar", surname: "Васильев", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах")]),
    User(id: 3, name: "Аркадий", onlineStatus: false, userAvatar: "Avatar", surname: "Сергеев", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")]),
    User(id: 4, name: "Виктор", onlineStatus: true, userAvatar: "Avatar", surname: "Сидоров", groups: [Group(id: 0, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 1, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")]),
    User(id: 5, name: "Павел", onlineStatus: true, userAvatar: "Avatar", surname: "Сурков", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах")]),
]

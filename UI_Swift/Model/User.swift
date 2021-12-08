//
//  User.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 30.11.2021.
//

import Foundation

struct User: Identifiable {
    let id: Int
    let name: String
    let onlineStatus: Bool
    let userAvatar: String
    let surname: String
    let groups: [Group]
    let userPhotoAlbum: [String]
}

let userData = [
    User(id: 0, name: "Василий", onlineStatus: true, userAvatar: "Avatar", surname: "Петров", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 2, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
    User(id: 1, name: "Всеволод", onlineStatus: false, userAvatar: "Avatar", surname: "Иванов", groups: [Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 2, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
    User(id: 2, name: "Иван", onlineStatus: true, userAvatar: "Avatar", surname: "Васильев", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
    User(id: 3, name: "Аркадий", onlineStatus: false, userAvatar: "Avatar", surname: "Сергеев", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
    User(id: 4, name: "Виктор", onlineStatus: true, userAvatar: "Avatar", surname: "Сидоров", groups: [Group(id: 0, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах"),Group(id: 1, groupAvatar: "serials", name: "Сериалы", description: "Группа о сериалах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
    User(id: 5, name: "Павел", onlineStatus: true, userAvatar: "Avatar", surname: "Сурков", groups: [Group(id: 0, groupAvatar: "books", name: "Книги", description: "Группа о книгах"), Group(id: 1, groupAvatar: "cinema", name: "Фильмы", description: "Группа о фильмах")], userPhotoAlbum: ["avataaars", "avataaars-2", "avataaars-3", "avataaars-4",  "avataaars-5", "avataaars-6"]),
]

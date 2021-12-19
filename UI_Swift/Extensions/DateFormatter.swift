//
//  DateFormatter.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 14.12.2021.
//

import Foundation

extension DateFormatter {
    func UNIXTime(timeStamp dateString: Int) -> String? {
        
        let getDate = Date(timeIntervalSince1970: TimeInterval(dateString))
        let stringDate = "\(getDate)"
        let nowDate = Int(Date().timeIntervalSince1970)
        
        let dateFormatterGet = DateFormatter()
        let dateFormatterSet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatterSet.locale = Locale(identifier: "ru_RU")
        
        let comparsion = nowDate - dateString
        
        switch comparsion {
        case 0..<3600:
            dateFormatterSet.dateFormat = "в HH:mm"
        case 3600..<7200:
            dateFormatterSet.dateFormat = "Час назад"
        case 7200..<10800:
            dateFormatterSet.dateFormat = "Два часа назад"
        case 10800..<14400:
            dateFormatterSet.dateFormat = "Три часа назад"
        default:
            dateFormatterSet.dateFormat = "d MMMM в HH:mm"
        }
        
        let date = dateFormatterGet.date(from: stringDate)
        let vkNewsDate = dateFormatterSet.string(from: date!)
        return vkNewsDate
        
    }
}

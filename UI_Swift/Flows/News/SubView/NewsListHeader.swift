//
//  NewsListHeader.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 13.12.2021.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct NewsListHeader: View {
    
    var newsGroups: NewsGroupsModel
    var newsDate: Int
    
    var body: some View {
        HStack {
            KFImage(URL(string: newsGroups.photo50!))
                .groupAvatarStyle()
            
            VStack(alignment: .leading) {
                Text(newsGroups.name!)
                    .foregroundColor(Color.accentColor)
                
                Text(DateFormatter().UNIXTime(timeStamp: newsDate)!)
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
    }
}

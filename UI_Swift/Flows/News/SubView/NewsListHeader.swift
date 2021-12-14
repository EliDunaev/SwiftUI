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
    
    var newsData: NewsModel
    @ObservedResults(NewsGroupsModel.self) var newsGroups
    
    var body: some View {
        ForEach(newsGroups) { data in
            HStack {
                if data.id == String(self.newsData.sourceId) {
                    KFImage(URL(string: data.photo50!))
                        .groupAvatarStyle()
                    
                    VStack(alignment: .leading) {
                        Text(data.name!)
                            .foregroundColor(Color.accentColor)
                        
                        Text(String(newsData.date))
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
        }
    }
}


//struct NewsListHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListHeader()
//    }
//}

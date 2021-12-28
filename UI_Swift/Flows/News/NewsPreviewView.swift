//
//  NewsPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct NewsPreviewView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    @ObservedResults(NewsModel.self) var news
    @ObservedResults(NewsGroupsModel.self) var newsGroups
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(news.sorted { $0.date > $1.date }, id: \.date) { news in
                    VStack {
                        ForEach(newsGroups) { groups in
                            if groups.id == news.sourceId {
                                NewsListHeader(newsGroups: groups, newsDate: news.date)
                                    .frame(maxWidth: .infinity,
                                           alignment: .leading)
                            }
                        }
                        
                        Spacer()
                        
                        KFImage(URL(string: news.photo!))
                            .resizable()
                            .frame(width: 350, height: 250)
                            .scaledToFit()
                        Text(news.text!)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        Spacer()
                        
                        NewsListFooter(footerData: news)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    }
                }
            }
            .refreshable{ self.viewModel.getNews() }
            .navigationTitle("Новости")
            .listStyle(GroupedListStyle())
        }
        .onAppear(perform: self.viewModel.getNews)
        .navigationBarHidden(true)
    }
}

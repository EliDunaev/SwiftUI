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
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(news) { news in
                    VStack {
                        NewsListHeader(newsData: news)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
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
            .navigationTitle("Новости")
            .listStyle(GroupedListStyle())
        }
        .navigationBarHidden(true)
        .onAppear(perform: self.viewModel.getNews)
    }
    
}

//struct NewsPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsPreviewView()
//    }
//}

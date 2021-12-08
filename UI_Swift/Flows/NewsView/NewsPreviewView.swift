//
//  NewsPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import SwiftUI

struct NewsPreviewView: View {
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(newsData){ news in
                    VStack {
                        HStack {
                            UserAvatarImage {
                                Image(news.newsAvatar)
                            }
                            VStack {
                                Text(news.newsLabel)
                                    .frame(maxWidth: .infinity,
                                           alignment: .leading)
                                    .foregroundColor(Color.accentColor)
                                Text("Вчера в 22:10")
                                    .frame(maxWidth: .infinity,
                                           alignment: .leading)
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        Image(news.newsPhoto)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .scaledToFit()
                        Text(news.newsText)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        Spacer()
                        NewsListFooter()
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    }
                }
            }
            .navigationTitle("Новости")
            .listStyle(GroupedListStyle())
        }
        .navigationBarHidden(true)
    }
    
}

struct NewsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPreviewView()
    }
}

//
//  NewsListFooter.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import SwiftUI

struct NewsListFooter: View {
    
    var footerData: NewsModel
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "heart")
                Text("\(footerData.likes)")
                Image(systemName: "message")
                Text("\(footerData.comments)")
                Image(systemName: "arrowshape.turn.up.right")
                Text("\(footerData.reposts)")
            }
            Spacer()
            HStack {
                Text("\(footerData.views)")
                Image(systemName: "eye")
            }
        }
    }
}

//struct NewsListFooter_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListFooter()
//    }
//}

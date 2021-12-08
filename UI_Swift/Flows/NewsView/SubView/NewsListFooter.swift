//
//  NewsListFooter.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import SwiftUI

struct NewsListFooter: View {
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "heart")
                Text("200")
                Image(systemName: "message")
                Text("15")
                Image(systemName: "arrowshape.turn.up.right")
                Text("46")
            }
            Spacer()
            HStack {
                Text("476")
                Image(systemName: "eye")
            }
        }
    }
}

struct NewsListFooter_Previews: PreviewProvider {
    static var previews: some View {
        NewsListFooter()
    }
}

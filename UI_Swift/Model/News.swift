//
//  News.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import Foundation

struct News: Identifiable {
    let id: Int
    let newsAvatar: String
    let newsLabel: String
    let newsText: String
    let newsPhoto: String
    let newsDate: String
    let newsLikes: Int
    let newsReply: Int
    let newsComments: Int
    let newsViews: Int
}

let newsData = [
    News(id: 0, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique hendrerit enim, nec interdum mi suscipit et. Fusce elementum felis orci, non accumsan libero faucibus non. Proin sit amet mauris quis felis efficitur cursus non non nisi. Proin a aliquam quam, et luctus lacus. Cras dictum et dolor ac faucibus.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 888),
    News(id: 1, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra, lacus dignissim eleifend ultrices, ipsum nisi iaculis velit, sit amet volutpat odio velit vel sem. Nunc leo lorem, tempor nec lorem sed, ullamcorper volutpat magna. Maecenas sodales nisi sit amet ullamcorper fermentum. Praesent mollis nisl sit amet sollicitudin venenatis. Mauris.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 356),
    News(id: 2, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ullamcorper nulla arcu, id malesuada erat rhoncus sed. Nunc a dolor in tortor iaculis pulvinar quis tincidunt nulla. Nunc sit amet erat ut lacus semper sodales. Nam maximus orci sed turpis vestibulum convallis. Morbi rhoncus felis massa, ut lacinia velit iaculis.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 12),
    News(id: 3, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor urna nec aliquet molestie. Ut suscipit vulputate justo ac malesuada. Quisque tristique a nisl consequat viverra. Duis sagittis, sapien eleifend fermentum interdum, erat leo hendrerit ligula, id feugiat libero elit finibus augue. Sed dignissim velit quis odio ultrices, sed laoreet.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 33),
    News(id: 4, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo dui, ultrices porttitor ante et, malesuada ornare dolor. Ut vitae vehicula nulla. In eget facilisis tortor. Nullam pretium, ex ut sollicitudin aliquet, justo erat ornare elit, eget malesuada ipsum lorem ac enim. Nunc fringilla nunc ipsum, ornare bibendum velit rutrum.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 337),
    News(id: 5, newsAvatar: "Avatar", newsLabel: "Lorem ipsum", newsText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum ante quis augue tincidunt tempor. Etiam pulvinar, dui eu dignissim auctor, felis turpis pretium purus, quis sodales mauris est sit amet nisl. Suspendisse vulputate, urna a aliquam vulputate, ex lorem laoreet nulla, nec varius erat sem quis lectus. Phasellus lobortis.", newsPhoto: "news", newsDate: "10.10.2021", newsLikes: 5, newsReply: 77, newsComments: 64, newsViews: 45),
]

//
//  UserPhotosPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 08.12.2021.
//

import SwiftUI
import ASCollectionView_SwiftUI
import RealmSwift
import Kingfisher

struct UserPhotosPreviewView: View {
    
    @ObservedObject var viewModel: UserPhotosViewModel
    
    @ObservedResults(PhotoModel.self) var photos
    
    @State private var photoHeightRow: CGFloat?
    @State private var footerHeightRow: CGFloat?
    
    var body: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 100, maximum: .infinity), spacing: 5)
        ]
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Spacer()
                LazyVGrid(columns: columns, alignment: .center, spacing: 0)  {
                    ForEach(photos, id: \.url) { photo in
                        if photo.ownerId == self.viewModel.userID {
                            VStack {
                                PhotoCell(photos: photo)
                                    .frame(height: photoHeightRow)
                                Divider()
                                PhotoGalleryFooter(viewModel: viewModel, photoFooterData: photo, apiService: APIRequest())
                                    .frame(height: footerHeightRow)
                                    .padding(.bottom)
                            }
                        }
                    }
                }
            }
            .padding([.leading, .trailing], 10)
            .onPreferenceChange(PhotoHeightPreferenceKey.self, perform: { value in
                self.photoHeightRow = value
            })
            .onPreferenceChange(FooterHeightPreferenceKey.self, perform: { value in
                self.photoHeightRow = value
            })
        }
        .navigationBarTitle(Text("Фото Альбом"), displayMode: .inline)
        .onAppear(perform: self.viewModel.getPhotoData)
    }
}

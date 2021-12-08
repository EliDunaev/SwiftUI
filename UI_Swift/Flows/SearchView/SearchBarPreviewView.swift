//
//  SearchBarPreviewView.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 07.12.2021.
//

import Foundation
import SwiftUI

struct SearchBarPreviewView : View {
    @Binding var searchTerm : String
    @State var showCancelButton = false

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Поиск", text: self.$searchTerm, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                }).foregroundColor(.primary)
                
                Button(action: {
                    self.searchTerm = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(self.searchTerm == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 4))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            if self.showCancelButton {
                Button("Отмена") {
                    UIApplication.shared.endEditing(true)
                    self.searchTerm = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
    }
}


extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

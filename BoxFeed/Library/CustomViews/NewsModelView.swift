//
//  NewsModelView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 09/07/21.
//

import SwiftUI

struct NewsModelView: View {
    
    var model: NewsModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: model.urlToImage) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.1)
                    ActivityIndicator(isAnimating: true)
                }
            }.frame(width: 100, height: 80).clipped().cornerRadius(4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(model.title ?? "").lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.text_primary)
                    .modifier(FontModifier(.bold, size: 14))
                HStack(alignment: .center, spacing: 12) {
                    if let date = model.publishedDate {
                        publishedDate(date)
                    }
                    if let author = model.author {
                        authorView(author)
                    }
                }
            }
        }
    }
    
    private func publishedDate(_ date: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image.calender.resizable()
                .renderingMode(.template)
                .foregroundColor(.text_primary)
                .frame(width: 17, height: 17)
                .offset(x: 0, y: -1)
            Text(date).lineLimit(1)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 12))
                .layoutPriority(1)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    private func authorView(_ author: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image.pen.resizable()
                .renderingMode(.template)
                .foregroundColor(.text_primary)
                .frame(width: 17, height: 17)
                .offset(x: 0, y: -1)
            Text(author).lineLimit(1)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 12))
        }
    }
}

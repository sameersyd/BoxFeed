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
                    newsData(image: Image.calender, text: model.publishedDate ?? "")
                    if let time = model.readTime {
                        newsData(image: Image.clock, text: "\(time < 10 ? "0" : "")\(time)m")
                    }
                }
            }
            
            Spacer()
        }
    }
    
    private func newsData(image: Image, text: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            image.resizable()
                .renderingMode(.template)
                .foregroundColor(.text_primary)
                .frame(width: 16, height: 16)
                .offset(x: 0, y: -1)
            Text(text).lineLimit(1)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 12))
        }
    }
}

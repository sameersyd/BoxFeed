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
        HStack(alignment: .center, spacing: 20) {
            AsyncImage(url: model.urlToImage) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.1)
                    ActivityIndicator(isAnimating: true)
                }
            }.frame(width: 100, height: 80).clipped()
            
            VStack(alignment: .leading, spacing: 12) {
                Text(model.title).lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.text_primary_color)
                    .modifier(FontModifier(.bold, size: 16))
                HStack(alignment: .center) {
                    newsData(image: Image.calender, text: model.publishedAt.format("MMM. dd, yyyy"))
                    Spacer()
                    if let time = model.readTime {
                        newsData(image: Image.clock, text: "\(time < 10 ? "0" : "")\(time) mins read")
                    }
                }
            }
        }
    }
    
    private func newsData(image: Image, text: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            image.resizable()
                .renderingMode(.template)
                .foregroundColor(.text_primary_color)
                .frame(width: 18, height: 18)
            Text(text).lineLimit(1)
                .foregroundColor(.text_primary_color)
                .modifier(FontModifier(.bold, size: 12))
        }
    }
}

//struct NewsModelView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsModelView()
//    }
//}

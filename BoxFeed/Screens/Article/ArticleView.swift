//
//  ArticleView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 09/07/21.
//

import SwiftUI

struct ArticleView: View {
    
    @Environment(\.dismiss) var dismiss
    var model: NewsModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    HeaderView(height: 400).frame(height: 400)
                    BodyView.padding(.horizontal, 18)
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


// Body View
extension ArticleView {
    
    private var BodyView: some View {
        VStack(spacing: 16) {
            AuthorView
            Text(model.content ?? "")
                .multilineTextAlignment(.leading)
                .foregroundColor(.text_primary.opacity(0.7))
                .modifier(FontModifier(.regular, size: 16))
                .frame(maxWidth: .infinity)
        }
    }
    
    private var AuthorView: some View {
        HStack(alignment: .center) {
            Text(model.author ?? "")
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 16))
            Spacer()
            Button(action: {  }) {
                Image.article.resizable()
                    .renderingMode(.template)
                    .foregroundColor(.text_primary)
                    .frame(width: 22, height: 22)
            }
        }
    }
}


// Header View
extension ArticleView {
    
    private func HeaderView(height: CGFloat) -> some View {
        GeometryReader { geo in
            ZStack {
                AsyncImage(url: model.urlToImage) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.1)
                        ActivityIndicator(isAnimating: true)
                    }
                }.frame(width: geo.size.width, height: height).clipped()
                
                Header_Gradient
                    .frame(width: geo.size.width, height: height)
                
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Button(action: {  }) {
                            Image.bookmark_filled.resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                        }
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image.x.resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 26, height: 26)
                        }
                    }.padding(.horizontal, 20).padding(.vertical, 60)
                    
                    Spacer()
                    
                    Header_DataView
                        .padding(.horizontal, 20).padding(.bottom, 16)
                    
                }.frame(width: geo.size.width, height: height)
            }.frame(width: geo.size.width, height: height)
        }
    }
    
    private var Header_Gradient: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                LinearGradient(
                    gradient: Gradient(colors: [.black, .black.opacity(0)]),
                    startPoint: .bottom, endPoint: .top
                ).frame(height: (geo.size.height / 100) * 50)
            }
        }
    }
    
    private var Header_DataView: some View {
        VStack(spacing: 20) {
            Text(model.title ?? "").lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .modifier(FontModifier(.bold, size: 32))
                .frame(maxWidth: .infinity)
            
            HStack(alignment: .center) {
                Text(model.id?.name ?? "Unknown").foregroundColor(.white)
                    .modifier(FontModifier(.extraBold, size: 12))
                Spacer()
                HStack(alignment: .bottom, spacing: 8) {
                    Image.calender.resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 16, height: 16)
                    Text(model.publishedDate ?? "")
                        .foregroundColor(.white)
                        .modifier(FontModifier(.bold, size: 12))
                        .padding(.bottom, -2)
                }
            }.padding(.horizontal, 4)
        }
    }
}

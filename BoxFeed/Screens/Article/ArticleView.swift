//
//  ArticleView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 09/07/21.
//

import SwiftUI

struct ArticleView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var model: NewsModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


// Header View
extension ArticleView {
    
    @ViewBuilder
    private var HeaderView: some View {
        let height: CGFloat = 400
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
                        Button(action: { presentationMode.wrappedValue.dismiss() }) {
                            Image.x.resizable()
                                .frame(width: 26, height: 26)
                        }
                        Spacer()
                        Button(action: {  }) {
                            Image.bookmark_filled.resizable()
                                .frame(width: 20, height: 20)
                        }
                    }.padding(.horizontal, 20).padding(.vertical, 60)
                    
                    Spacer()
                    
                    Header_DataView
                        .padding(.horizontal, 20).padding(.bottom, 16)
                    
                }.frame(width: geo.size.width, height: height)
            }
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
            Text(model.title).lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .modifier(FontModifier(.bold, size: 32))
                .frame(maxWidth: .infinity)
            
            HStack(alignment: .center) {
                Text(model.source.name).foregroundColor(.white)
                    .modifier(FontModifier(.extraBold, size: 12))
                Spacer()
                HStack(alignment: .bottom, spacing: 8) {
                    Image.calender.resizable()
                        .frame(width: 16, height: 16)
                    Text(model.publishedAt.format("MMM. dd, yyyy"))
                        .foregroundColor(.white)
                        .modifier(FontModifier(.bold, size: 12))
                        .padding(.bottom, -2)
                }
            }.padding(.horizontal, 4)
        }
    }
}

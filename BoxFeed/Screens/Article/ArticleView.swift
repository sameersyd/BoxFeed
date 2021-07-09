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
                
                VStack {
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
                    }.padding(.horizontal, 25).padding(.vertical, 60)
                    Spacer()
                }.frame(height: height)
            }
        }
    }
}

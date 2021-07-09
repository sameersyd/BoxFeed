//
//  HomeView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HeaderView
                    
                    NewsSelectorView(selection: $viewModel.selection)
                        .padding(.top, 24)
                    
                    List {
                        ForEach(0..<viewModel.news.count, id: \.self) { i in
                            Button(action: { viewModel.selectArticle(index: i) }) {
                                NewsModelView(model: viewModel.news[i])
                                    .padding(.vertical, 4)
                                    .padding(.top, i == 0 ? 12 : 0)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .swipeActions {
                            Button(action: {  }) {
                                Image(systemName: "bookmark")
                            }.tint(.main_color)
                        }
                    }
                    .refreshable {
                        await viewModel.fetchNews()
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
                .fullScreenCover(isPresented: $viewModel.showArticle,
                                 onDismiss: { viewModel.selectedArticle = nil }) {
                    if let article = viewModel.selectedArticle {
                        ArticleView(model: article)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private var HeaderView: some View {
        HStack(alignment: .center) {
            Text("Breaking News").foregroundColor(.main_color)
                .modifier(FontModifier(.bold, size: 32))
            Spacer()
            
            Image.bookmark.resizable().renderingMode(.template)
                .foregroundColor(.black).frame(width: 22, height: 22)
        }.padding(.horizontal, 16)
    }
}

//
//  HomeView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    // CoreData
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: ArticleCD.getAllArticles()) var articles: FetchedResults<ArticleCD>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    headerView
                    NewsSelectorView(selection: $viewModel.selection)
                        .padding(.top, 24)
                    
                    List {
                        ForEach(0..<viewModel.news.count, id: \.self) { i in
                            Button(action: { viewModel.selectArticle(index: i) }) {
                                NewsModelView(model: viewModel.news[i])
                                    .padding(.vertical, 4)
                                    .padding(.top, i == 0 ? 12 : 0)
                                    .listRowSeparator(.hidden)
                            }.swipeActions {
                                Button(action: {
                                    viewModel.bookmarkArticle(viewModel.news[i], articles, moc)
                                }) {
                                    Image(systemName: viewModel.isBookmarked(viewModel.news[i], articles)
                                          ? "bookmark" : "bookmark.fill")
                                }
                                .tint(.main_color)
                            }
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
                .fullScreenCover(isPresented: $viewModel.openBookmarks) {
                    BookmarksView()
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        HStack(alignment: .center) {
            Text("Breaking News").foregroundColor(.main_color)
                .modifier(FontModifier(.bold, size: 32))
            Spacer()
            Button(action: { viewModel.openBookmarks = true }) {
                Image.bookmark.resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 22, height: 22)
            }
        }.padding(.horizontal, 16)
    }
}

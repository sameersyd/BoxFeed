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
                    if viewModel.isOffline { offlineView }
                    else { content }
                }
                .edgesIgnoringSafeArea(.bottom)
                .fullScreenCover(isPresented: $viewModel.showArticle,
                                 onDismiss: { viewModel.selectedArticle = nil }) {
                    if let article = viewModel.selectedArticle {
                        ArticleView(viewModel: ArticleViewModel(model: article))
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
            if !viewModel.isOffline {
                Button(action: { viewModel.openBookmarks = true }) {
                    Image.bookmark.resizable()
                        .renderingMode(.template)
                        .foregroundColor(.main_color)
                        .frame(width: 22, height: 22)
                }
            }
        }.padding(.horizontal, 16)
    }

    private var content: some View {
        VStack(spacing: 0) {
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
                        }.tint(.main_color)
                    }
                }
            }.refreshable { await viewModel.fetchNews() }
            Spacer()
        }
    }

    private var offlineView: some View {
        VStack(alignment: .center, spacing: 0) {
            Image.offline.frame(maxWidth: .infinity)
                .padding(.top, 100)
            Text("Looks like you’re offline. No problem checkout bookmarks")
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.regular, size: 16))
                .multilineTextAlignment(.center)
                .padding(.top, 26)

            Button(action: { viewModel.openBookmarks = true }) {
                Text("Bookmarks").foregroundColor(.primary_color)
                    .modifier(FontModifier(.bold, size: 14))
                    .frame(maxWidth: .infinity).frame(height: 45)
                    .background(Color.main_color)
                    .padding(.horizontal, 8)
            }.padding(.top, 50)

            Button(action: { viewModel.checkInternet() }) {
                Text("Retry").foregroundColor(.text_primary)
                    .modifier(FontModifier(.bold, size: 14))
            }.padding(.top, 16)
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

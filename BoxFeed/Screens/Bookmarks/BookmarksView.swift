//
//  BookmarksView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 18/09/21.
//

import SwiftUI

struct BookmarksView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = BookmarksViewModel()
    // CoreData
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: ArticleCD.getAllArticles()) var articles: FetchedResults<ArticleCD>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    headerView
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            Text("Bookmarks")
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 32))
            Spacer()
            Button(action: { dismiss() }) {
                Image.x.resizable()
                    .renderingMode(.template)
                    .foregroundColor(.text_primary)
                    .frame(width: 26, height: 26)
            }
        }.padding(.horizontal, 20)
    }
}

//
//  HomeViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import SwiftUI
import CoreData
import Network

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var selection = 0 {
        didSet {
            async { await fetchNews() }
        }
    }
    @Published private(set) var news = [NewsModel]()
    
    @Published var openBookmarks = false
    @Published var showArticle = false
    @Published var selectedArticle: NewsModel? = nil
    
    let service = NewsService()
    @Published private(set) var isOffline = false
    
    init() { checkInternet() }

    func checkInternet() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            self.isOffline = path.status != .satisfied
            if !self.isOffline { async { await self.fetchNews() } }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    func fetchNews() async {
        if let articles = try? await service.fetchNews(Sources.allCases[selection]) {
            withAnimation {
                self.news = articles
            }
        }
    }
    
    func selectArticle(index: Int) {
        selectedArticle = news[index]
        showArticle = true
    }
    
    func isBookmarked(_ model: NewsModel, _ articles: FetchedResults<ArticleCD>) -> Bool {
        for article in articles {
            if article.url == model.url?.absoluteString {
                return true
            }
        }
        return false
    }
    
    func bookmarkArticle(
        _ model: NewsModel, _ articles: FetchedResults<ArticleCD>,
        _ moc: NSManagedObjectContext
    ) {
        for article in articles {
            if article.url == model.url?.absoluteString {
                removeBookmark(article, moc)
                return
            }
        }
        addBookmark(model, moc)
    }
    
    private func addBookmark(_ article: NewsModel, _ moc: NSManagedObjectContext) {
        let model = ArticleCD(context: moc)
        model.id = UUID()
        model.createdAt = Date()
        model.sourceId = article.id?.rawValue
        model.author = article.author
        model.content = article.content
        model.desc = article.description
        model.publishedAt = article.publishedAt
        model.title = article.title
        model.url = article.url?.absoluteString
        model.urlToImage = article.urlToImage?.absoluteString
        do { try moc.save() }
        catch { print(error.localizedDescription) }
    }
    
    private func removeBookmark(_ article: ArticleCD, _ moc: NSManagedObjectContext) {
        moc.delete(article)
        do {
            try moc.save()
        } catch { print(error.localizedDescription) }
    }
}

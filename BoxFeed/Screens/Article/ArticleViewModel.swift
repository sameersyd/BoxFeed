//
//  ArticleViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 18/09/21.
//

import SwiftUI
import CoreData

class ArticleViewModel: ObservableObject {
    
    let model: NewsModel
    
    init(model: NewsModel) {
        self.model = model
    }
    
    func isBookmarked(_ articles: FetchedResults<ArticleCD>) -> Bool {
        for article in articles {
            if article.url == model.url?.absoluteString {
                return true
            }
        }
        return false
    }
    
    func bookmarkArticle(
        _ articles: FetchedResults<ArticleCD>,
        _ moc: NSManagedObjectContext
    ) {
        for article in articles {
            if article.url == model.url?.absoluteString {
                removeBookmark(article, moc)
                return
            }
        }
        addBookmark(moc)
    }
    
    private func addBookmark(_ moc: NSManagedObjectContext) {
        let articleObj = ArticleCD(context: moc)
        articleObj.id = UUID()
        articleObj.createdAt = Date()
        articleObj.sourceId = model.id?.rawValue
        articleObj.author = model.author
        articleObj.content = model.content
        articleObj.desc = model.description
        articleObj.publishedAt = model.publishedAt
        articleObj.title = model.title
        articleObj.url = model.url?.absoluteString
        articleObj.urlToImage = model.urlToImage?.absoluteString
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

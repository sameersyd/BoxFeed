//
//  BookmarksViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 18/09/21.
//

import Foundation
import CoreData

class BookmarksViewModel: ObservableObject {
    
    init() {}
    
    func removeBookmark(_ article: ArticleCD, _ moc: NSManagedObjectContext) {
        moc.delete(article)
        do {
            try moc.save()
        } catch { print(error.localizedDescription) }
    }
}

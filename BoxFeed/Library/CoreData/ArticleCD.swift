//
//  ArticleCD.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 18/09/21.
//

import Foundation
import CoreData

public class ArticleCD: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID?
    @NSManaged public var createdAt: Date?
    @NSManaged public var sourceId: String?
    @NSManaged public var author: String?
    @NSManaged public var content: String?
    @NSManaged public var desc: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
}

extension ArticleCD {
    static func getAllArticles() -> NSFetchRequest<ArticleCD> {
        let request: NSFetchRequest<ArticleCD> = ArticleCD.fetchRequest() as! NSFetchRequest<ArticleCD>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}

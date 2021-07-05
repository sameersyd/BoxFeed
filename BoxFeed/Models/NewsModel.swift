//
//  NewsModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 06/07/21.
//

import Foundation

struct NewsModel {
    
    var sourceId: String
    var sourceName: String
    
    var publishedAt: Date
    var readTime: Int
    var author: String
    
    var title: String
    var description: String
    var content: String
    
    var newsUrl: String
    var imageUrl: String
}

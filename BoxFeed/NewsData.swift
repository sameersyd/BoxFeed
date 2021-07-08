//
//  NewsData.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 09/07/21.
//

import Foundation

// Dummy data for NewsModel
struct NewsData {
    
    static private let source = NewsSource(id: .bbcNews, name: Sources.bbcNews.name)
    static private let author = "Caroline Vakil"
    static private let title = "FAA fines airline passenger more than $10K for refusing to wear mask | TheHill - The Hill"
    static private let description = "The Federal Aviation Administration (FAA)"
    static private let url = "https://www.iphoneincanada.ca/news/new-brunswick-electric-vehicle-rebate/"
    static private let imageURLs = [
        "https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/07/27/23/trump-scranton.jpg?width=1200&auto=webp&quality=75",
        "https://images.mktw.net/im-365887/social",
        "https://images.mktw.net/im-365887/social",
        "https://i.insider.com/60c909f923393a00188e3544?width=1200&format=jpeg",
        "https://static.seekingalpha.com/cdn/s3/uploads/getty_images/1317955939/large_image_1317955939.jpg",
        "https://www.carscoops.com/wp-content/uploads/2021/07/Tesla-Model-S.jpg",
        "https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png",
        "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iVmlnuLlu.2k/v0/1200x800.jpg",
        "https://d.newsweek.com/en/full/1841109/tesla-driving-access-tunnel.jpg",
        "https://cdn.iphoneincanada.ca/wp-content/uploads/2021/07/new-brunswick-EV-rebate.jpeg"
    ]
    static private let content = "According to New Brunswick’s new electric vehicle rebate program, those who purchase or lease an EV from a dealer in the province will be eligible for up to $5,000 CAD from the New Brunswick Electric"
    
    static func getNewsData(_ id: Sources) async -> [NewsModel] {
        Thread.sleep(forTimeInterval: 2)
        var model = [NewsModel]()
        for _ in 0..<25 {
            model.append(NewsModel(
                source: NewsSource(id: id, name: id.name), author: author, title: title, description: description,
                url: URL(string: url), urlToImage: URL(string: imageURLs.randomElement()!),
                publishedAt: Date(), content: content, readTime: (3..<15).randomElement()))
        }
        return model
    }
}

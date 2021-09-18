//
//  NewsService.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 17/09/21.
//

import Foundation

final class NewsService {
    
    func fetchNews(_ id: Sources) async throws -> [NewsModel]? {
        
        let urlString = "https://newsapi.org/v2/everything?q=\(id)&from=2021-08-18&sortBy=publishedAt&apiKey=\(AppConfig.API_KEY)"
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        if var model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            for i in 0..<(model.articles?.count ?? 0) {
                model.articles?[i].id = id
                #warning("remove random read time")
                model.articles?[i].readTime = (1...30).randomElement()
            }
            return model.articles
        }
        return []
    }
}

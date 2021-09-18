//
//  HomeViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var selection = 0 {
        didSet {
            async { await fetchNews() }
        }
    }
    @Published var news = [NewsModel]()
    
    @Published var showArticle = false
    @Published var selectedArticle: NewsModel? = nil
    
    let service = NewsService()
    
    init() {
        async { await fetchNews() }
    }
    
    func fetchNews() async {
        if let articles = try? await service.fetchNews(Sources.allCases[selection]) {
            self.news = articles
        }
    }
    
    func selectArticle(index: Int) {
        selectedArticle = news[index]
        showArticle = true
    }
}

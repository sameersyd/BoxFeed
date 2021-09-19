//
//  ArticleViewModel.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 18/09/21.
//

import Foundation

class ArticleViewModel: ObservableObject {
    
    let model: NewsModel
    
    init(model: NewsModel) {
        self.model = model
    }
}

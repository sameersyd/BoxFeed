//
//  NewsSource.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import Foundation

enum NewsSource: String, CaseIterable {
    
    case bbcNews = "bbc-news"
    case bbcSport = "bbc-sport"
    case bloomberg = "bloomberg"
    case businessInsider = "business-insider"
    case cnn = "cnn"
    case espn = "espn"
    case fortune = "fortune"
    case googleNews = "google-news"
    case hackerNews = "hacker-news"
    case mashable = "mashable"
    case msnbc = "msnbc"
    case nbcNews = "nbc-news"
    case nextBigFuture = "next-big-future"
    case polygon = "polygon"
    case recode = "recode"
    case talksport = "talksport"
    case techcrunch = "techcrunch"
    case techradar = "techradar"
    case theHindu = "the-hindu"
    case theNextWeb = "the-next-web"
    case theTimesOfIndia = "the-times-of-india"
    case theVerge = "the-verge"
    case theWallStreetJournal = "the-wall-street-journal"
    case theWashingtonPost = "the-washington-post"
    case time = "time"
    case usatoday = "usa-today"
    case vicenews = "vice-news"
    case wired = "wired"
    
    var name: String {
        switch self {
        case .bbcNews: return "BBC News"
        case .bbcSport: return "BBC Sport"
        case .bloomberg: return "Bloomberg"
        case .businessInsider: return "Business Insider"
        case .cnn: return "CNN"
        case .espn: return "ESPN"
        case .fortune: return "Fortune"
        case .googleNews: return "Google News"
        case .hackerNews: return "Hacker News"
        case .mashable: return "Mashable"
        case .msnbc: return "MSNBC"
        case .nbcNews: return "NBC News"
        case .nextBigFuture: return "Next Big Future"
        case .polygon: return "Polygon"
        case .recode: return "Recode"
        case .talksport: return "TalkSport"
        case .techcrunch: return "TechCrunch"
        case .techradar: return "TechRadar"
        case .theHindu: return "The Hindu"
        case .theNextWeb: return "The Next Web"
        case .theTimesOfIndia: return "The Times of India"
        case .theVerge: return "The Verge"
        case .theWallStreetJournal: return "The Wall Street Journal"
        case .theWashingtonPost: return "The Washington Post"
        case .time: return "Time"
        case .usatoday: return "USA Today"
        case .vicenews: return "Vice News"
        case .wired: return "Wired"
        }
    }
}

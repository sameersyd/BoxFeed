//
//  DateExtension.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 09/07/21.
//

import Foundation

extension Date {
    func format(_ format: String = "MMM dd, yyyy - hh:mm:a") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Macbook on 16/01/23.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormatter() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

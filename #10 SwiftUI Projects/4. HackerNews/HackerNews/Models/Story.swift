//
//  Story.swift
//  HackerNews
//
//  Created by Shrimp Hsieh on 2022/5/12.
//

import Foundation

struct Story: Decodable {
    
    let id: Int
    let title: String
    let url: String
    
}

extension Story {
    
    static func placeHolder() -> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
    
}

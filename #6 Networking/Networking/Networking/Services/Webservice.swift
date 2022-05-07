//
//  Webservice.swift
//  Networking
//
//  Created by Shrimp Hsieh on 2022/5/7.
//

import Foundation
import Combine

class Webservice {
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL")
        }
        
        // Here is returning you the sequence which is simply the data.
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)  // Receive data on main thread
            .eraseToAnyPublisher()
        
    }

}

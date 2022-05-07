import UIKit
import Combine

// Networking Example
// URLSession.shared.dataTaskPublisher

struct Post: Codable {
    let title: String
    let body: String
}

func getPosts() -> AnyPublisher<[Post], Error> {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        fatalError("Invalid URL")
    }
    
    // Here is returning you the sequence which is simply the data.
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    
}

// We can access to all the different bytes, basically the data that is being returned from the JSON placeholder post url.
let cancellable = getPosts().sink(receiveCompletion: { _ in }, receiveValue: { print($0) })

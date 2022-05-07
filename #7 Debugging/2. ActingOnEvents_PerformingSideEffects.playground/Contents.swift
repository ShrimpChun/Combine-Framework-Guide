import UIKit
import Combine

// Print operator example: Acting on events

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url)

let subscription = request
    .handleEvents(receiveSubscription: { _ in print("Subscription Received")},
                  receiveOutput: { _, _ in print("Received Output") },
                  receiveCompletion: { _ in print("Received Completion") },
                  receiveCancel: { print("Received Cancel") },
                  receiveRequest: { _ in print("Reveived Request") })
//    .print()
    .sink(receiveCompletion: { print($0) }, receiveValue: { data, response in
    print(data)
})

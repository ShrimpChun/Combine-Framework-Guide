import UIKit
import Combine
import Foundation

struct Post: Codable {
    let title: String
    let body: String
}

var cancellables = Set<AnyCancellable>()

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

/*
 Implementing a network request using the `share()` operator will result in only one subscription being made to the upstream publisher since a unique resource will be shared to the downstream subscribers.
*/

print("===== share() =====")

let request = URLSession.shared.dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .replaceError(with: [])
    .print()
    .share()

request
    .sink {
        print("Subscription 1 value: \($0)")
    }
    .store(in: &cancellables)

request
    .sink {
        print("Subscription 2 value: \($0)")
    }
    .store(in: &cancellables)


/*
 The process is straightforward —
 
 1. The first subscriber subscribes to the posts publisher triggering the receive subscription event.
 2. Through the sink() method, an unlimited amount of values is requested.
 3. The value starts flowing.
 4. First subscriber receives the value from the resource.
 5. Second subscriber receives the value from the same resource.
 6. The publisher's job is done.. a completion event is sent.
 
 Try removing the `share()` operator and you will notice the exact same events occurring twice (since it is copied).
 
 The `share()` operator does not involve any buffering system which means that if the second subscription occurs after the request has completed, it will only receive the completion event.
 
 Unfortunately, Combine doesn’t provide with a `shareReplay()` operator such as in its RxSwift counterpart however we could use the `multicast()` operator to address this issue.
*/

/*
 The `multicast()` operator uses a `ConnectablePublisher` type which provides a `connect()` method to trigger the publisher once all of the subscribers are setup.

 A subject must be provided to deliver elements to the multiple subscribers.
*/

print("===== multicast() =====")

let postsSubject = PassthroughSubject<[Post], Never>()
let posts = URLSession.shared.dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .replaceError(with: [])
    .print()
    .multicast(subject: postsSubject)

posts
    .sink(receiveValue: {
        print("Multicast Subscription 1 value: \($0)")
    })
    .store(in: &cancellables)

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    posts
        .sink(receiveValue: {
            print("Multicast Subscription 2 value: \($0)")
        })
        .store(in: &cancellables)
}

/*
 At this point, nothing happens since we didn’t connect our subscribers to the upstream publisher.
 
 To fix this issue, adding the following code right after the second subscription in the `DispatchQueue` block
*/

posts
    .connect()
    .store(in: &cancellables)


/*
 The `multicast()` operator is useful when sharing a single resource with multiple subscribers while keeping the actual network request implementation private.

 There is a nice alternative to create a connectable wrapper around a publisher using the `makeConnectable()` method which will turn instantly your publisher into a `ConnectablePublisher` without having to deal with a subject.

 Remove the `postsSubject` property and replace the `multicast(subject:)` operator by `makeConnectable()`.

*/

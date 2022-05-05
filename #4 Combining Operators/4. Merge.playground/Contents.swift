import UIKit
import Combine

// Merge operator allows you to merge the different events from different publishers.

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

publisher1
    .merge(with: publisher2)
    .sink {
        print($0)
}

publisher1.send(10)
publisher1.send(11)
publisher2.send(12)
publisher2.send(13)

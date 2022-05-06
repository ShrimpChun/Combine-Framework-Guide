import UIKit
import Combine

// Count operator can simply tell you how many of these items are in the particular sequence.

let publisher = ["A", "B", "C", "D"].publisher

let publisher1 = PassthroughSubject<Int, Never>()

publisher
    .count()
    .sink {
        print($0)
}

// This publisher is going to give you the number of times or how many values were actually emitted by the publisher
publisher1
    .count()
    .sink {
        print($0)
}

publisher1.send(10)
publisher1.send(10)
publisher1.send(10)
publisher1.send(10)

// In order of this to work, it has to receive the finish on the completion event.
publisher1.send(completion: .finished)

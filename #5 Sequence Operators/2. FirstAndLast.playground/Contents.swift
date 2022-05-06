import UIKit
import Combine

// First and Last operators allow you to find first or last value in the sequence.

let publisher = ["A", "B", "C", "D"].publisher

print("First Publisher")

publisher
    .first()
    .sink {
        print($0)
}

publisher
    .first(where: { "CBA".contains($0) })
    .sink {
        print($0)
    }

print("Last Publisher")

publisher
    .last()
    .sink {
        print($0)
}

publisher
    .last(where: { "CBA".contains($0) })
    .sink {
        print($0)
}

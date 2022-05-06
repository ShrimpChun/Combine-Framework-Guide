import UIKit
import Combine

// Output operator allow you access element from index or some elements from a range.

let publisher = ["A", "B", "C", "D"].publisher

publisher
    .output(at: 2)
    .sink {
        print($0)
}

print("Output(in)")

publisher
    .output(in: (0...2))
    .sink {
        print($0)
}

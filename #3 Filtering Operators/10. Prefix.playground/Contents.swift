import UIKit
import Combine

let numbers = (1...10).publisher

// Prefix operator which simply selects prefix meaning and start of the sequence number of values.

// Select a maximum amount of values
numbers.prefix(2).sink {
    print($0)
}

// Select based on a certain condition
numbers.prefix(while: { $0 < 3 }).sink {
    print($0)
}

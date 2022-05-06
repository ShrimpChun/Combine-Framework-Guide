import UIKit
import Combine

// Min and Max operators allow you to find min or max value in the sequence.

let publisher = [1, -20, 3, 55, 100].publisher

publisher
    .min()
    .sink {
        print($0)
}

publisher
    .max()
    .sink {
        print($0)
}

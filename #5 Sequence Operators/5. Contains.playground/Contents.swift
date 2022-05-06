import UIKit
import Combine

// Contains operators can simply search the element which you want to find.

let publisher = ["A", "B", "C", "D"].publisher

publisher
    .contains("C")
    .sink {
        print($0)
}

publisher
    .contains("E")
    .sink {
        print($0)
}

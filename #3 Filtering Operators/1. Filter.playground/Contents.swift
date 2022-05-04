import UIKit
import Combine

let numbers = (1...20).publisher

// Filter Odd numbers
numbers.filter { $0 % 2 == 0 }
    .sink {
        print($0)
}

// Filter Event numbers
numbers.filter { $0 % 2 != 0 }
    .sink {
        print($0)
}

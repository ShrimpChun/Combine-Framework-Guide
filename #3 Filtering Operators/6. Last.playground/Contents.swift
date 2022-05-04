import UIKit
import Combine

let numbers = (1...9).publisher

// The First operator allows you to find the last particular item or value.
numbers.last(where: { $0 % 2 == 0 })
    .sink {
        print($0)
}

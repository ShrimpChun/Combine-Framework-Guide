import UIKit
import Combine

let numbers = (1...9).publisher

// The First operator allows you to find the first particular item or value.
numbers.first(where: { $0 % 2 == 0 })
    .sink {
        print($0)
}

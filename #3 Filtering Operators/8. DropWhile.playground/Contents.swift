import UIKit
import Combine

let numbers = (1...10).publisher

// The Drop while operator will be based on a particular condition.
// It's going to drop the values while the condition will be TRUE.
numbers.drop(while: { $0 % 3 != 0 })
    .sink {
        print($0)
}

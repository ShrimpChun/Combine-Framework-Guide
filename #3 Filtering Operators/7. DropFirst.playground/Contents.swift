import UIKit
import Combine

let number = (1...10).publisher

// The DropFirst operator allows you to drop certain items, values from your sequence.
number.dropFirst(8)
    .sink {
        print($0)
}

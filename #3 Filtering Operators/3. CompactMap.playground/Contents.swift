import UIKit
import Combine

let array = ["a", "1.24", "b", "3.65", "123.456"].publisher

// In this case, all elements will convert to Float type.
// These elements will return nil if they cannot be convert,
// CompactMap will ignore nil value.
array
    .compactMap { Float($0) }
    .sink {
        print($0)
}

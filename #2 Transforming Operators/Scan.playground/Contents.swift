import UIKit
import Combine

let publisher = (1...10).publisher

// First argument is the initial result, which can be of any type,
// The next argument is actually a closure that takes in the type of the first argument
// that you have set up.
publisher.scan([]) { numbers, value -> [Int] in
    numbers + [value]
}.sink {
    print($0)
}

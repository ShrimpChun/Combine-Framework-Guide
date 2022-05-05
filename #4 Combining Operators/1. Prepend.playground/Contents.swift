import UIKit
import Combine

let numbers = (1...5).publisher
let publisher2 = (500...510).publisher

// Prepend operator allows you to append your sequence or values before the other sequence or initial values.
numbers
    .prepend(100, 101)      // Positive number
    .prepend(-1, -2)        // Negative number
    .prepend([45, 46, 47])  // Array
    .prepend(publisher2)    // Other publisher
    .sink {
    print($0)
}

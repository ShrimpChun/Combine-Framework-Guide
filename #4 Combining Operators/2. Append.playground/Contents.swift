import UIKit
import Combine

let numbers = (1...10).publisher
let publisher2 = (500...510).publisher

// Append operator allows you to append your sequence or values in the end of the other sequence or initial values.
numbers
    .append(99, 100)
    .append(-10, -11)
    .append([50, 51, 52])
    .append(publisher2)
    .sink {
    print($0)
}

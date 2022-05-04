import UIKit
import  Combine

let numbers = (1...5000).publisher

// The IgnoreOutput operator allows you to ignore all the items and simply prints out finished.
numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

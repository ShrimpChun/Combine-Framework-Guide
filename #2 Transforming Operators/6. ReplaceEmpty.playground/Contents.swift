import UIKit
import Combine

// You can use Empty that sometimes you don't want to pass any parameter.
let empty = Empty<Int, Never>()

// Just Pass Result
empty.sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

// ReplaceEmpty
empty.replaceEmpty(with: 1)
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

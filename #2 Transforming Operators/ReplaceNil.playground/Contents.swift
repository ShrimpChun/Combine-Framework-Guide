import UIKit
import Combine

// You can use replaceNil to replace whatever you want.
let array = ["A", "B", nil, "C"]

// The value inside the map will never be nil because you already replaced the nil
array.publisher.replaceNil(with: "*")
    .map { $0! }
    .sink { print($0) }

import UIKit
import Combine

// Collect Operator

var array = ["A", "B", "C", "D"]

array.publisher.sink {
    print($0)
}

// Group
array.publisher.collect().sink {
    print($0)
}

// How many items do you want to group together
array.publisher.collect(2).sink {
    print($0)
}

array.append("E")

array.publisher.collect(2).sink {
    print($0)
}

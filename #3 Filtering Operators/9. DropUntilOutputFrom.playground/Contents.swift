import UIKit
import Combine

// DropUntilOutputFrom is going to drop the events or the values from a sequence,
// Until it get an output from another publisher.

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady)
    .sink {
        print($0)
}

(1...10).forEach { num in
    taps.send(num)
    
    if num == 3 {
        // Start to keep the events or the values, not will be droped
        isReady.send()
    }
}

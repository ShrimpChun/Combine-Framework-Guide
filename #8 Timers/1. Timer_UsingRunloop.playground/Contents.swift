import UIKit
import Combine

// Create a timer using the Runloop.

let runloop = RunLoop.main

let subcription = runloop
    .schedule(after: runloop.now,
              interval: .seconds(2),
              tolerance: .microseconds(100)) {
        
        print("Timer fired")
        
}

runloop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
    subcription.cancel()
}

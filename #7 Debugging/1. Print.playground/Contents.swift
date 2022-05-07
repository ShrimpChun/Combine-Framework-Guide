import UIKit
import Combine

// Print operator can help you see what exactly is going on.

let publisher = (1...20).publisher

publisher
    .print("Debugging")
    .sink {
        print($0)
}

import UIKit
import Combine

let words = "apple apple fruit apple mango banana watermelon apple".components(separatedBy: " ").publisher

// Without remove duplicates
words.sink {
    print($0)
}

// With remove duplicates
// If two events are coming and they are the same exact value in this case,
// It's going to start removing those duplicates.
words
    .removeDuplicates()
    .sink {
        print($0)
}

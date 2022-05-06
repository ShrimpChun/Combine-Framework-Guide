import UIKit
import Combine

// AllSatisfy operator allows you to exam each and every value in the sequence must satisfy the condition.

let publisher = [1, 2, 3, 4, 5, 6, 7].publisher

publisher
    .allSatisfy { $0 % 2 == 0 }
    .sink { allEven in
        print(allEven)
}

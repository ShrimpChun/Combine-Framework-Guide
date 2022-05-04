import UIKit
import Combine

// To convert or transform array of numbers into the English language equivalent.
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

var array = [123, 456, 789]

// Output: one hundred twenty-three, four hundred fifty-six and so on.
array.publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    // Spell out in English language
    print($0)
}

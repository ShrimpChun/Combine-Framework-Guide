import UIKit
import Combine

// You can access the individual values using the Map KeyPath structure
struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

// Access Point.x and Point.y values
publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x) and y is \(y)")
}

// Input
publisher.send(Point(x: 5, y: 10))

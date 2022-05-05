import UIKit
import Combine

let images = ["Houston", "Columbia", "LasVegas"]
var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {
    
    return Future<UIImage?, Never> { promise in
        
        DispatchQueue.global().asyncAfter(deadline: .now()) {
            promise(.success(UIImage(named: images[index])))
        }
        
    }.map { $0 }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    
}

let taps = PassthroughSubject<Void, Never>()

// Fire the subscription
let subsrciption = taps.map { _ in getImage() }
    .print()
    .switchToLatest()
    .sink {
        print($0)
}

// Houston
taps.send()

// Columbia
DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
    index += 1
    taps.send()
}

// LasVegas
DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
    index += 1
    taps.send()
}

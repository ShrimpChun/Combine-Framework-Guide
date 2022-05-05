import UIKit
import Combine

/*
 
 Zip operator is going to pair two different elements or different item of values form publishers,
 those publishers can have different types.
 
 This operator is simply going to pick and try to pair depending on the values that it's receiving
 from both publishers.
 
 (String)
 Publisher 2    ＿＿＿＿＿＿＿＿＿Ⓐ＿＿＿＿＿Ⓑ＿＿＿＿＿＿＿＿＿＿＿＿＿Ⓒ＿＿＿＿＿...
 (Int)          　　　　　　　　　↓　　　　　 ↓　　　　　　　　　　  　　↓
 Publisher 1    ＿＿①＿＿②＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿③＿＿＿＿＿＿＿＿＿＿＿＿...
                　　↓　　 ↓　　　　　　　　　　　　　　  　↓
                ＿＿＿＿＿＿＿＿＿＿＿＿＿ Zip (publisher2) ＿＿＿＿＿＿＿＿＿＿＿＿
                            　 ↓         ↓                     ↓
 Result         ＿＿＿＿＿＿＿＿「①,Ⓐ」＿＿「②,Ⓑ」＿＿＿＿＿＿＿＿＿「③,Ⓒ」＿＿...
 
 */

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1
    .zip(publisher2)
    .sink {
        print("P1: \($0), P2: \($1)")
}

publisher1.send(1)
publisher1.send(2)
publisher2.send("A")
publisher2.send("B")
publisher1.send(3)
publisher2.send("C")
publisher2.send("D")

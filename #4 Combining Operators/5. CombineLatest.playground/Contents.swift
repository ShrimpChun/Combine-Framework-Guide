import UIKit
import Combine

/*
 
 CombineLatest operator is going to combine two different publishers,
 those publishers can have different types.
 The latest value from each of the publisher is combined together into a tuple.
 
 (String)
 Publisher 1    ＿＿＿＿＿＿＿＿＿Ⓐ＿＿＿＿＿Ⓑ＿＿＿＿＿＿＿＿＿＿＿＿＿Ⓒ＿＿＿＿＿...
 (Int)          　　　　　　　　　↓　　　　　 ↓　　　　　　　　　　  　　↓
 Publisher 2    ＿＿①＿＿②＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿③＿＿＿＿＿＿＿＿＿＿＿＿...
                　　↓　　 ↓　　　　　　　　　　　　　　  　↓
                ＿＿＿＿＿＿＿＿＿＿ CombineLatest (publisher2) ＿＿＿＿＿＿＿＿
                            　 ↓         ↓          ↓          ↓
 Result         ＿＿＿＿＿＿＿＿「②,Ⓐ」＿＿「②,Ⓑ」＿＿「③,Ⓑ」＿＿「③,Ⓒ」＿＿...
 
 */
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1
    .combineLatest(publisher2)
    .sink {
        print("P1: \($0), P2: \($1)")
}

publisher1.send(1)
publisher2.send("A")
publisher2.send("B")

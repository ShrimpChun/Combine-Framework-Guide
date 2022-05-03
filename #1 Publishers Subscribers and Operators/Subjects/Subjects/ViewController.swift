//
//  ViewController.swift
//  Subjects
//
//  Created by Shrimp Hsieh on 2022/4/29.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completed")
    }
    
    typealias Input = String
    typealias Failure = MyError
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Subjects
        //  - Publisher
        //  - Subscribers
        
        let subscriber = StringSubscriber()
        
        let subject = PassthroughSubject<String, MyError>()
        
        subject.subscribe(subscriber)
        
        let subscription = subject.sink { (completion) in
            
            print("Received Completion from sink")
            
        } receiveValue: { value in
            
            print("Received Value from sink")
        }

        subject.send("A")
        subject.send("B")
        
        subscription.cancel()
        
        subject.send("C")
        subject.send("D")
        
    }


}


//
//  ViewController.swift
//  Subscriber
//
//  Created by Shrimp Hsieh on 2022/4/29.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
    
    func receive(subscription: Subscription) {
        print("Receive Subscription")
        subscription.request(.max(3))   // Backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Receive value", input)
        return .none
        // return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
    typealias Input = String
    typealias Failure = Never
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
        
        let subscriber = StringSubscriber()
        
        publisher.subscribe(subscriber)
        
    }


}


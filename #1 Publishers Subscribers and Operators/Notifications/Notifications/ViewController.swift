//
//  ViewController.swift
//  Notifications
//
//  Created by Shrimp Hsieh on 2022/4/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a notification
        let notification = Notification.Name("MyNotification")
        
        // Create a publisher
        let publisher = NotificationCenter.default.publisher(for: notification)
        
        // Create a subscription
        let subscription = publisher.sink { _ in
            print("Notification received!")
        }
        
        // Publisher will receive the notification
        NotificationCenter.default.post(name: notification, object: nil)
        
        // Cancel the activity
        subscription.cancel()
        
        // Publisher will not receive the notification
        NotificationCenter.default.post(name: notification, object: nil)
        
    }


}


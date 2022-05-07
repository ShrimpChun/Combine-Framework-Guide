//
//  ViewController.swift
//  Debugging
//
//  Created by Shrimp Hsieh on 2022/5/7.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = (1...10).publisher
        
        // Using debugger as a breakpoint to break on those conditions
        // So you can jump into the debugger.
        
        self.cancellable = publisher
            .breakpoint(receiveOutput: { value in
                return value > 9
            })
            .sink(receiveValue: {
                print($0)
            })
    }

}


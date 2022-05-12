//
//  FancyTimer.swift
//  ObservableObject-SwiftUI
//
//  Created by Shrimp Hsieh on 2022/5/12.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {
    
    @Published var value: Int = 0
    
    init() {
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.value += 1
        })
        
    }
    
}

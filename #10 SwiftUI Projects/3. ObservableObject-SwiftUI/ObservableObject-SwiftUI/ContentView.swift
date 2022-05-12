//
//  ContentView.swift
//  ObservableObject-SwiftUI
//
//  Created by Shrimp Hsieh on 2022/5/11.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    /*
     
     - SwiftUI gives us the @ObservedObject property wrapper so that views can watch the state of an external object, and be notified when something important has changed.
     
     - It is similar in behavior to @StateObject, except it must not be used to create objects – use @ObservableObject only with objects that have been created elsewhere, otherwise SwiftUI might accidentally destroy the object.

     1. Ay type you mark with @ObservedObject must conform to the ObservableObject protocol, which in turn means it must be a class rather than a struct. This isn’t optional – SwiftUI requires us to use a class here.
     
     2. Observed objects are specifically designed for data that is external to your view, which means it might be shared across more than one view. The @ObservedObject property wrapper will automatically make sure the property is watched closely so that important changes will reload any views using it. This also means the data must be created elsewhere, then sent in to your view.
     
     3. Not all properties in an observed object cause views to refresh – you need to decide which properties should send change notifications, either using @Published or custom announcements. Types that conform to ObservableObject are given a default objectWillChange publisher to make custom announcements as needed.
     
     */
    
    @ObservedObject var fancyTimer = FancyTimer()
    
    var body: some View {
        Text("\(self.fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  State-SwiftUI
//
//  Created by Shrimp Hsieh on 2022/5/11.
//

import SwiftUI

struct ContentView: View {
    
    /*
     
     - SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are value types.
     
     - @State should be used with simple struct types such as String, Int, and arrays, and generally shouldn’t be shared with other views.
     
     - If you want to share values across views, you should probably use @ObservedObject or @EnvironmentObject instead – both of those will ensure that all views will be refreshed when the data changes.
     
     */
    
    var model = Dish.all()
    
    @State private var isSpicy = false
    
    var body: some View {
        
        List {
            
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title)
            }
            
            ForEach(model.filter { $0.isSpicy == self.isSpicy }) { dish in
                
                HStack {
                    
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(dish.name)
                        .font(.title)
                        .lineLimit(nil)
                    
                    Spacer()
                    
                    if (dish.isSpicy) {
                        Image("spicy-icon")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

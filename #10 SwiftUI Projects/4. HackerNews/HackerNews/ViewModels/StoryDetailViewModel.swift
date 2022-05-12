//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Shrimp Hsieh on 2022/5/12.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
        
    private var cancellable: AnyCancellable?
    
    @Published private var story = Story.placeHolder()
    
    func fetchStoryDetails(storyId: Int) {
        print("about to make network request")
        self.cancellable = Webservice().getStoryById(storyId: storyId)
            .catch { _ in Just(Story.placeHolder()) }
            .sink(receiveCompletion: { _ in }, receiveValue: { story in
                self.story = story
            })
        
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
    
}

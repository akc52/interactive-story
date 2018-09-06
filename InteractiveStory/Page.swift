//
//  Page.swift
//  InteractiveStory
//
//  Created by Alyssa C on 2018-09-05.
//  Copyright © 2018 Al Ciccone. All rights reserved.
//

import Foundation

class Page {
    let story: Story;
    
    typealias Choice = (title: String, page: Page) //named tuple
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story;
    }
}

extension Page {
    
    func addChoiceWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addChoiceWith(title: title, page: page)
    }
    
    // ' -> Page'  (syntax, is the return)
    func addChoiceWith(title: String, page: Page) -> Page {
        
        switch (firstChoice, secondChoice) {
        case(.some, .some): return self
        case(.none, .none), (.none, .some): firstChoice = (title, page)
        case(.some, .none): secondChoice = (title, page)
        }
        
        /*
            // if neither nil/both have choices, return self
            guard firstChoice != nil && secondChoice != nil else { return page }
 
            if firstChoice == nil {
                firstChoice = (title, page)
            } else {
                secondChoice = (title, page)
            }
        */
        
        return page
    }
}

/*
 typealias Degree = Double;
 func rotate(by angle: Degree) {}
*/

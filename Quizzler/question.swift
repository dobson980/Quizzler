//
//  question.swift
//  Quizzler
//
//  Created by Tom Dobson on 8/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
 
    init (question: String, correctAnswer: Bool) {
        questionText = question
        answer = correctAnswer
    }
    
}

//
//  questionBank.swift
//  Quizzler
//
//  Created by Tom Dobson on 8/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var questionList = [Question]()
        
    func compileQuestions() {
        for (text,answer) in QuestionData().questions {
            questionList.append(Question(question: text, correctAnswer: answer))
        }
    }
    
}

//
//  answerValidate.swift
//  Quizzler
//
//  Created by Tom Dobson on 8/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit

class AnswerValidation {
    
    var label: String?
    var imageBank: [UIImage] = [#imageLiteral(resourceName: "correctModal"),#imageLiteral(resourceName: "errorModal")]
    var image: UIImage?
    
    func checkAnswer(for userAnswer: Bool) {
    
        if userAnswer == true {
            self.label = "Correct!"
            self.image = imageBank[0]
        } else {
            self.label = "Wrong!"
            self.image = imageBank[1]
        }
        
    }
    
}

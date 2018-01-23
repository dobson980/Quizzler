//
//  ViewController.swift
//  Quizzler
//
//  Created by Tom Dobson on 8/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    let answerValidate = AnswerValidation()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var trackerStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iPhoneXConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(nextQuestion), name: NSNotification.Name("modalDismiss"), object: nil)
        importQuestions()
        nextQuestion()
        
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            
            pickedAnswer = true
            
        }
        else if sender.tag == 2 {
            
            pickedAnswer = false

        }

        questionNumber += 1
        checkAnswer()
        
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) \\ \(allQuestions.questionList.count)"
        progressBar.frame.size.width = ((view.frame.size.width - 16) / CGFloat(allQuestions.questionList.count)) * CGFloat(questionNumber + 1)
        
    }
    

    @objc func nextQuestion() {
        
        if questionNumber <= (allQuestions.questionList.count - 1) {
            
            questionLabel.text = allQuestions.questionList[questionNumber].questionText
            updateUI()
            
        } else {
            
            restartQuizAlert()
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.questionList[questionNumber - 1].answer
        
        if correctAnswer == pickedAnswer {
            
            score += 1
            answerValidate.checkAnswer(for: true)
            presentModal()
            
        } else {
            
            answerValidate.checkAnswer(for: false)
            presentModal()
            
            }
        
        }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
       
    }
    
    func importQuestions() {
    
        allQuestions.compileQuestions()
    
    }
    
    func restartQuizAlert() {
     
        let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
            self.startOver()
            
        })
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func presentModal() {

        performSegue(withIdentifier: "answerModalDetails", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "answerModalDetails") {

            let modal : ModalAnswerViewController = (segue.destination as? ModalAnswerViewController)!
            modal.answerImageStore = answerValidate.image
            modal.answerLabelStore = answerValidate.label

        } else {
            fatalError("Did not find segue")
        }

    }
    
    func iPhoneXConstraints() {

        if #available(iOS 11, *) {
            
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                trackerStackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10)
                ])
        
        }
    }

}



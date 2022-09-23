//
//  QuizVC.swift
//  Quiz App
//
//  Created by Clayville on 22/9/2022.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet var questionImageView: UIImageView!
    
    @IBOutlet var questionLabel: UILabel!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
        
    }
    
    // MARK: -  Buttons
    
    
    @IBAction func trueButtonTapped(_ sender: Any) {
        
        let result = quiz.checkAnswer(answer: true)
        showResultAlert(isCorrect: result)
    }
    
    
    @IBAction func falseButtonPressed(_ sender: Any) {
        
        let result = quiz.checkAnswer(answer: false)
        showResultAlert(isCorrect: result)
    }
    
    
    // MARK: - Functions
    
    func setupQuestion(){
        
        // Gets current question
        
        let currentQuestion = quiz.getQuestion()
        questionImageView.image = currentQuestion.image
        questionLabel.text = currentQuestion.question
        
    }
    
    func showResultAlert(isCorrect correct: Bool){
        
        let title = correct ? "Correct" : "Incorrect"
        let message = correct ? "You got the answer right" : "You're just wrong"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
        
        let nextQuestionAction = UIAlertAction(title: "Next Question", style: .default) { (action) in
            
            if self.quiz.nextQuestion(){
                
                self.setupQuestion()
                alert.dismiss(animated: true, completion: nil)
                
            } else {
                
                alert.dismiss(animated: true)
                self.showFinalScore()
                
            }
        }
        
        alert.addAction(nextQuestionAction)
        
        present(alert, animated: true)
        
    }
    
    func showFinalScore(){
        
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action ) in
             
            self.quiz.resetQuiz()
            self.setupQuestion()
            alert.dismiss(animated: true )
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    
}

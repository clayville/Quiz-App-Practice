//
//  Model.swift
//  Quiz App
//
//  Created by Clayville on 22/9/2022.
//

import Foundation
import UIKit

struct QuizQuestion{
    
    var correctAnswer: Bool
    var question: String
    var image: UIImage
    
}


class Quiz{
    
    private var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a true?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a person?", image: UIImage(named: "mug")!)
    ]
    
    private var score = 0
    private var questionIndex = 0
    
    // Gets the current score
    func getScore() -> String{
        return "\(score) \\ \(questions.count)"
    }
    
    // Get question
    
    func getQuestion() -> QuizQuestion{
        
        return questions[questionIndex]
    }
    
    // Check answer
    
    func checkAnswer(answer: Bool) -> Bool{
        
        let question = getQuestion()
        
        if question.correctAnswer == answer{
            
            // increment the score
            
            score += 1
            
            return true
        }
        
        return false
    }
    
    // Get next question
    
    func nextQuestion() -> Bool{
         
        questionIndex += 1
        
        if questionIndex > questions.count - 1{
            return false
        }
         
        return true
    }
    
    // Reset quiz
    
    func resetQuiz(){
        
        questionIndex = 0
        score = 0
    }
    
     
}



import UIKit

class ViewController: UIViewController {
    

    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber = 0
    var score = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        updateUI()
            }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
     
        }
        else  {
            pickedAnswer = false
            
        }
        
        checkAnswer()
      questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
       scoreLabel.text = "Score \(score)"
       progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else {
            let alert = UIAlertController(title: "Awesome", message: "You have successfully completed the quiz", preferredStyle: .alert)
            let restartApp = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
             alert.addAction(restartApp)
            present(alert, animated: true, completion: nil)
           
        }
        }
    
    
    func checkAnswer() {
        if allQuestions.list[questionNumber].answer == pickedAnswer {
            print("You Got It!")
            score = score + 1
              ProgressHUD.showSuccess("Correct")
        }
        else {
            print("Wrong")
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
}

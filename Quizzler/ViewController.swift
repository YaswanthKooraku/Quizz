

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = Questionbank()
    
    var pickedAnswer : Bool = true
    var score : Int = 0
    var questionNumber : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       let question = allQuestions.list[questionNumber]
        
        questionLabel.text = question.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        

        if sender.tag == 1 {
                pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber += 1

        nextQuestion()
    }
    
    
    func updateUI() {
        progressLabel.text = ("\(questionNumber+1)/13")
        scoreLabel.text = "Score:\(score)"
        
        progressBar.frame.size.width = ((view.frame.size.width)/13) * CGFloat (questionNumber + 1)
 
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
        let nextquestion = allQuestions.list[questionNumber]
        questionLabel.text = nextquestion.questionText
            updateUI()
        }
        else{
            
            let alert = UIAlertController(title: "Alert", message: "Quiz is Completed ", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let firstanswer = allQuestions.list[questionNumber].answer
        
        if firstanswer == pickedAnswer {
            print("correct")
            ProgressHUD.showSuccess("WOW")
            score += 1
            
            
        }
            else  {
                print("wrong")
            ProgressHUD.showError("Tryagain")
            }
        
        
    
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
        
        
        
        
       
    }
    

    
}

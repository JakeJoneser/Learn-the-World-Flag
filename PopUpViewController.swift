//
//  PopUpViewController.swift
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var continueButton: UIButton!
    
    var viewController: QuizViewController! =  QuizViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreLabel.text = ("\(viewController?.getScore() ?? -1) ") + NSLocalizedString("Point", comment: "")
        
//        restartButton.setTitle(NSLocalizedString("Restart", comment: ""), for: .normal)
        continueButton.setAttributedTitle(NSAttributedString(string: NSLocalizedString("Restart", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
    }
    
    @IBAction func continueGame(_ sender: Any) {
//        if viewController?.rewardBaseAd.isReady == true {
//            viewController?.rewardBaseAd.present(fromRootViewController: self)
        dismiss(animated: true) {
            self.initQuiz()
        }
//        viewController.present(self, animated: true, completion: nil)
//        } else {
//            let alertController = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("Ad did not load", comment: ""), preferredStyle: .alert)
//
//            let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default)
//
//            alertController.addAction(okAction)
//
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true) {
            self.initQuiz()
        }
    }
    
    func initQuiz() {
        self.viewController?.initScore()
        self.viewController?.initLife()
        self.viewController?.initQuiz()
        self.viewController?.makeQuestion()
        self.viewController?.textFitInButton()
        self.viewController?.setDefaultButtonStyle()
    }
    
}

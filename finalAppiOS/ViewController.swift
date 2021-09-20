//
//  ViewController.swift
//  finalAppiOS
//
//  Created by LA Tamara Salvatori on 19/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBOutlet weak var emailText: UITextField!

    @IBOutlet weak var passwordText: UITextField!


    @IBAction func pressedButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCont = storyboard.instantiateViewController(withIdentifier: "homeStoryboard")

        var email = emailText.text!
        var password = passwordText.text!

        if (isValidEmail(email) == true) {
            self.present(viewCont, animated: true, completion: nil)
        } else {

            let alert = UIAlertController(title: "Login error", message: "You should type valid email and password", preferredStyle: UIAlertController.Style.alert)

            let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
            }

            alert.addAction(okBtn)

            self.present(alert, animated: true, completion: nil)

        }

    }
}


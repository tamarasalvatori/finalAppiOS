//
//  ViewController.swift
//  finalAppiOS
//
//  Created by LA Tamara Salvatori on 19/09/21.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        let userLogged = defaults.bool(forKey: "UserLogged")

        if userLogged == true {
            present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeStoryboard"), animated: true, completion: nil)
        }
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

        let email = emailText.text!
        let password = passwordText.text!

        if (isValidEmail(email) == true) {
            self.present(viewCont, animated: true, completion: nil)
            defaults.set(true, forKey: "UserLogged")
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


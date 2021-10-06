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

        let loggedUser = defaults.bool(forKey: "LoggedUser")

        if loggedUser == true {
            goToHome()
        }
    }

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    @IBAction func pressedButton(_ sender: UIButton) {

        let email = emailText.text!
        let password = passwordText.text

        if (isValidEmail(email) == true && password != "") {
            goToHome()
            defaults.set(true, forKey: "LoggedUser")
        } else {
            displayAlert()
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func displayAlert() {
        let alert = UIAlertController(title: "Erro ao tentar fazer login", message: "Você deve digitar um email válido e uma senha ", preferredStyle: UIAlertController.Style.alert)

        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in }

        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    func goToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewCont = storyboard.instantiateViewController(withIdentifier: "homeStoryboard")

        self.present(viewCont, animated: true, completion: nil)
    }
}


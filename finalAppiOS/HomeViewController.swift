//
//  HomeViewController.swift
//  finalAppiOS
//
//  Created by LA Tamara Salvatori on 19/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        logoutBtn.layer.cornerRadius = 5
    }

    @IBOutlet weak var logoutBtn: UIButton!

    @IBAction func logoutBtnPressed(_ sender: UIButton) {

        defaults.set(false, forKey: "LoggedUser")

        logout()
    }

    func logout() {
        present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginStoryboard"), animated: true, completion: nil)
    }
}

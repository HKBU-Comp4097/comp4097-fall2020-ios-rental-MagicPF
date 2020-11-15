//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login page launched")
        // Do any additional setup after loading the view.
    }
    //Juan
    //Bagguley
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var UserTextField: UITextField!
    @IBAction func LoginRequest(_ sender: UIButton) {
        let networkController = NetworkController()
        networkController.Login(username:UserTextField.text ?? "",password: PWTextField.text ?? "", completionHandler:
            { (myuser) in
                DispatchQueue.main.async {
                    User.currentUser.username = myuser.username
                    User.currentUser.avatar = myuser.avatar
                    User.currentUser.id = myuser.id
                    
                    let alert = UIAlertController(
                            title: "Congratulation!",
                        message: "Welcome to Estate Rental\(self.UserTextField.text ?? "Username")", preferredStyle: .alert)
                    alert.addAction(
                            UIAlertAction(title: "OK", style: .default, handler: { (action) in
                                print("OK button pressed!")
                            })
                        )
                        self.present(alert, animated: true, completion: nil)
                    self.performSegue(withIdentifier: "LoginF", sender: "login")
                }
        }) { (error) in
            DispatchQueue.main.async {
                print("The Error reason is \(error)")
                let alert = UIAlertController(
                        title: "Oops! Login faild",
                    message: "There is sth wrong with your account~", preferredStyle: .alert)
                alert.addAction(
                        UIAlertAction(title: "OK", style: .default, handler: { (action) in
                            print("OK button pressed!")
                        })
                    )
                    self.present(alert, animated: true, completion: nil)
            }
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

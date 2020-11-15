//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    let networkController = NetworkController()
    var father:UIViewController?
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
                    self.father?.viewDidLoad()
                    self.presentingViewController!.dismiss(animated: true, completion: nil)
                    
//                    self.performSegue(withIdentifier: "login", sender: "login")
                }
        }) { (error) in
            DispatchQueue.main.async {
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewController = segue.source as? UserViewController {
//            if User.currentUser.id != -1{
//                networkController.fetchImage(for: User.currentUser.avatar, completionHandler: { (data) in
//                    DispatchQueue.main.async {
//                        viewController.avatarView.image = UIImage(data: data, scale:1)
//                    }
//                }) { (error) in
//                    DispatchQueue.main.async {
//                        viewController.avatarView.image = UIImage(systemName: "person.fill")
//                    }
//                }
//                viewController.NameView.text = User.currentUser.username
//
//            }         // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        }
//
//    }
}

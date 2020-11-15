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
            { () in
                DispatchQueue.main.async {
                    print("LOGIN SUCCESSED")
                }
        }) { (error) in
            DispatchQueue.main.async {
                print("LOGIN FAILD")
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

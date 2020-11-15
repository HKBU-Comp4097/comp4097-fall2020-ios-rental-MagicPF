//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var NameView: UILabel!
    let networkController = NetworkController()
    override func viewDidLoad() {
        super.viewDidLoad()
        if User.currentUser.id != -1{
            networkController.fetchImage(for: User.currentUser.avatar, completionHandler: { (data) in
                DispatchQueue.main.async {
                    self.avatarView.image = UIImage(data: data, scale:1)
                }
            }) { (error) in
                DispatchQueue.main.async {
                    self.avatarView.image = UIImage(systemName: "person.fill")
                }
            }
            self.NameView.text = User.currentUser.username
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogIO(_ sender: UIButton) {
        if User.currentUser.id == -1{
            self.performSegue(withIdentifier: "Login", sender: nil)
        }
        else{
            User.currentUser.id = -1
            avatarView.image = UIImage(systemName: "person.fill")
            NameView.text = "Username"
            networkController.Logout(completionHandler: { (response) in
                    print("Logout already")
            }){ (error) in
                DispatchQueue.main.async {
                    print("no")
                }
            }
        }
        
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? LoginViewController {
            viewController.father = self
        }
   }

}

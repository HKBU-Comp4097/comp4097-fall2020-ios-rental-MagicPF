//
//  UserViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    let networkController = NetworkController()
    var viewContext: NSManagedObjectContext?
    var pid:Int?
    var pbed:Int?
    var pest:String?
    var prent:Int?
    var pten:Int?
    var pimg:String?
    var parea:Int?
    var ptitle:String?
    var report:String?
    @IBOutlet weak var PImage: UIImageView!
    @IBOutlet weak var PTitle: UILabel!
    @IBOutlet weak var PEstate: UILabel!
    @IBOutlet weak var PRoom: UILabel!
    @IBOutlet weak var PRent: UILabel!
    @IBOutlet weak var PTenant: UILabel!
    @IBOutlet weak var PArea: UILabel!
    @IBOutlet weak var PMovein: UIButton!
    @IBOutlet weak var PAddress: UIButton!
    lazy var fetchedResultsController: NSFetchedResultsController<PropertyManagedObject> = {
        
        let fetchRequest = NSFetchRequest<PropertyManagedObject>(entityName:"Property")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending:true)]
            if let code = pid {
                fetchRequest.predicate = NSPredicate(format: "id = %@", pid!)
            }
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: viewContext!,
                                                    sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return controller
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let TitleLabel = viewWithTag(2) as? UILabel {
//            cellLabel.text = fetchedResultsController.object(at: <#T##IndexPath#>).property_title
//        }
//        print("OPENED \(ptitle) ~~~~~~")
        PTitle.text = ptitle
        PEstate.text = pest
        PRoom.text = String(pbed ?? -1)
        PRent.text = String(prent ?? -1)
        PArea.text = String(parea ?? -1)
        PTenant.text = String(pten ?? -1)
        networkController.fetchImage(for: pimg ?? "", completionHandler: { (data) in
            DispatchQueue.main.async {
                self.PImage.image = UIImage(data: data, scale:1)
            }
        }) { (error) in
            DispatchQueue.main.async {
                self.PImage.image = UIImage(systemName: "house.fill")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowMap(_ sender: UIButton) {
        print("Button Pressed")
        self.performSegue(withIdentifier: "ShowMap", sender: "Address Button")
    }
    
    @IBAction func MoveIN(_ sender: UIButton) {
        if User.currentUser.id == -1{
            let alert = UIAlertController(
                    title: "Hummmmmmm",
                message: "Please Login First~ :)", preferredStyle: .alert)
            alert.addAction(
                    UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        print("OK button pressed!")
                    })
                )
                self.present(alert, animated: true, completion: nil)
        }
        networkController.MoveIN(fk: pid ?? -1, method: "POST",completionHandler: { (response) in
            DispatchQueue.main.async {
                switch response {
                case 200: self.report = "Congraduation! Moved In~"
                case 422: self.report = "Already Full~"
                case 409: self.report = "Already Rented,Moved Out~"
                default: self.report = "Error Occured!!!"
                }
                
                print("Inside The report is \(self.report)")
                
                let alert = UIAlertController(
                        title: "Move In state",
                    message: self.report, preferredStyle: .alert)
                alert.addAction(
                        UIAlertAction(title: "OK", style: .default, handler: { (action) in
                            print("OK button pressed!")
                        })
                    )
                    self.present(alert, animated: true, completion: nil)
                // handle move out here
                
                if(response == 409){
                self.networkController.MoveIN(fk: self.pid ?? -1, method: "DELETE",completionHandler: { (response) in
                        switch response {
                        case 200: self.report = "Moved Out~"
                        default: self.report = "Error Occured"
                        }
                }){ (error) in
                    DispatchQueue.main.async {
                        print("no")
                    }
                }
                }
                //handle move out here
            }
        }){ (error) in
            DispatchQueue.main.async {
                print("no")
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ShowMap"{
            let viewcontroller = segue.destination as! MapViewController
            viewcontroller.estate = self.pest
            viewcontroller.apart = self.title
         }
     }
}
extension DetailViewController: NSFetchedResultsControllerDelegate {
  
}

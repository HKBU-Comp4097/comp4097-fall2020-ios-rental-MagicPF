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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController: NSFetchedResultsControllerDelegate {
  
}

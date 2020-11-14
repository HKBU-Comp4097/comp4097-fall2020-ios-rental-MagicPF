//
//  EstateTableViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 14/11/2020.
//

import UIKit
import CoreData
class EstateTableViewController: UITableViewController {
    var viewContext: NSManagedObjectContext?
    var code: String?
    lazy var fetchedResultsController: NSFetchedResultsController<PropertyManagedObject> = {
        
        let fetchRequest = NSFetchRequest<PropertyManagedObject>(entityName:"Property")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "estate", ascending:true)]
        if let code = code {
            fetchRequest.predicate = NSPredicate(format: "estate = %@", code)
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
        let dataController = (UIApplication.shared.delegate as? AppDelegate)!.dataController!
        viewContext = dataController.persistentContainer.viewContext
//        code = "Festival City"
//        if code != nil{
//            code = nil
//        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return fetchedResultsController.sections?[section].numberOfObjects ?? 0

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstateCell", for: indexPath)
        cell.textLabel?.text = fetchedResultsController.object(at: indexPath).estate
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? SpecificTableViewController {
                    
                    let Index = tableView.indexPathForSelectedRow!
                viewController.estateQuery = fetchedResultsController.object(at: Index).estate
                }         // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
}
extension EstateTableViewController: NSFetchedResultsControllerDelegate {
  
}

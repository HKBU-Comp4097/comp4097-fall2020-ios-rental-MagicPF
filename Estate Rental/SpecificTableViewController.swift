//
//  EstateTableViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 14/11/2020.
//

import UIKit
import CoreData
class SpecificTableViewController: UITableViewController {
    var viewContext: NSManagedObjectContext?
    var estateQuery: String?
    var RoomQuery: Int?
    
    lazy var fetchedResultsController: NSFetchedResultsController<PropertyManagedObject> = {
        
        let fetchRequest = NSFetchRequest<PropertyManagedObject>(entityName:"Property")
        if estateQuery != nil{
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "estate", ascending:true)]
            if let code = estateQuery {
                fetchRequest.predicate = NSPredicate(format: "estate = %@", code)
            }
        }
        else{
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "bedrooms", ascending:true)]
            if let code = RoomQuery {
                if code > 0{
                    fetchRequest.predicate = NSPredicate(format: "bedrooms >= \(code)")
                }
                else{
                    fetchRequest.predicate = NSPredicate(format: "bedrooms <= \(-code)")
                }
            }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCell", for: indexPath)
        cell.textLabel?.text = fetchedResultsController.object(at: indexPath).property_title
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? DetailViewController {
                let Index = tableView.indexPathForSelectedRow!
                viewController.pid = Int(fetchedResultsController.object(at: Index).id)
                viewController.pbed = Int(fetchedResultsController.object(at: Index).bedrooms)
                viewController.pest = fetchedResultsController.object(at: Index).estate
                viewController.prent = Int(fetchedResultsController.object(at: Index).rent)
                viewController.pten = Int(fetchedResultsController.object(at: Index).expected_tenants)
                viewController.pimg = fetchedResultsController.object(at: Index).image_URL
                viewController.parea = Int(fetchedResultsController.object(at: Index).gross_area)
                viewController.ptitle = fetchedResultsController.object(at: Index).property_title
                
                
                
                }         // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }

}
extension SpecificTableViewController: NSFetchedResultsControllerDelegate {
  
}

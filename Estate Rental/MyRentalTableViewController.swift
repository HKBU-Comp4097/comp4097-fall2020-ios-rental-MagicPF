//
//  HomeTableViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class MyRentalTableViewController: UITableViewController {
    let networkController = NetworkController()
    var property: [Property] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networkController.fetchMyRentals(completionHandler:
            { (property) in
                DispatchQueue.main.async {
                    self.property = property
                    self.tableView.reloadData()
                }
        }) { (error) in
            DispatchQueue.main.async {
                print("ERROR OCCUERED IN MY RENTAL")
                self.property = []
                self.tableView.reloadData()
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return property.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        cell.textLabel?.text = property[indexPath.row].property_title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? DetailViewController {
                let Index = tableView.indexPathForSelectedRow!
                viewController.pid = (property[Index.row].id)
                viewController.ptitle = property[Index.row].property_title
                viewController.prent = (property[Index.row].rent)
                viewController.parea = (property[Index.row].gross_area)
                viewController.pimg = property[Index.row].image_URL
                viewController.pbed = (property[Index.row].bedrooms)
                viewController.pten = (property[Index.row].expected_tenants)
                viewController.parea = (property[Index.row].gross_area)
                viewController.pest = property[Index.row].estate
            
            }
        }
}

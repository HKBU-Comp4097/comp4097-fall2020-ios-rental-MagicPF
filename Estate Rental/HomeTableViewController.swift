//
//  HomeTableViewController.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import UIKit

class HomeTableViewController: UITableViewController {
    let networkController = NetworkController()
    var property: [Property] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networkController.fetchNews(completionHandler:
            { (property) in
                DispatchQueue.main.async {
                    self.property = property
                    self.tableView.reloadData()
                }
        }) { (error) in
            DispatchQueue.main.async {
                self.property = []
                self.tableView.reloadData()
            }
        }
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
        if let imageView = cell.viewWithTag(100) as? UIImageView {
                    
            networkController.fetchImage(for: property[indexPath.row].image_URL, completionHandler: { (data) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data, scale:1)
                }
            }) { (error) in
                DispatchQueue.main.async {
                    imageView.image = UIImage(systemName: "house.fill")
                }
            }
            
        }
            
            if let cellLabel = cell.viewWithTag(200) as? UILabel {
                cellLabel.text = property[indexPath.row].property_title
            }
            
            if let cellLabel = cell.viewWithTag(300) as? UILabel {
                cellLabel.text = property[indexPath.row].estate
            }

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
            
            }         // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }

}

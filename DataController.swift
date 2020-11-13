//
//  DataController.swift
//  Estate Rental
//
//  Created by 潘丰 on 14/11/2020.
//

import Foundation
import CoreData

class DataController {
    
    var persistentContainer: NSPersistentContainer
    
    init(completion: @escaping () -> ()) {
        
        persistentContainer = NSPersistentContainer(name: "EstateRentalModel")
        persistentContainer.loadPersistentStores { (description, error) in
            
            if let error = error {
                fatalError("Core Data stack could not be loaded. \(error)")
            }
            
            // Called once initialization of Core Data stack is complete
            DispatchQueue.main.async {
//                self.seedData()
                completion()
            }
        }
    }
    
}

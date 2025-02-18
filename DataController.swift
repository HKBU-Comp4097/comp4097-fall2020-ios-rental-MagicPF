import Foundation
import CoreData

class DataController {
    
    var persistentContainer: NSPersistentContainer
    let nwController = NetworkController()
    var shouldSeedDatabase: Bool = false
    init(completion: @escaping () -> ()) {
            
        // Check if the database exists
        do {
            let databaseUrl =
                try FileManager.default.url(for: .applicationSupportDirectory,
                                            in: .userDomainMask, appropriateFor: nil,
                                            create: false).appendingPathComponent("EstateRentalModel.sqlite")
            
            shouldSeedDatabase = !FileManager.default.fileExists(atPath: databaseUrl.path)
        } catch {
            shouldSeedDatabase = true
        }
        
        persistentContainer = NSPersistentContainer(name: "EstateRentalModel")
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data stack could not be loaded. \(error)")
            }
            
            // Called once initialization of Core Data stack is complete
            DispatchQueue.main.async {
                if (self.shouldSeedDatabase) {
                    self.seedData()
                }
                completion()
            }
        }
    }
    private func seedData() {
        nwController.fetchNews(completionHandler:
            { (property) in
                DispatchQueue.main.async {[self] in
                    self.persistentContainer.performBackgroundTask { (managedObjectContext) in
                        property.forEach{(property)in
                            let propertyManagedObject = PropertyManagedObject(context: managedObjectContext)
                            propertyManagedObject.createdAt = Int64(property.createdAt)
                            propertyManagedObject.updatedAt = Int64(property.updatedAt)
                            propertyManagedObject.id = Int64(property.id)
                            propertyManagedObject.property_title = property.property_title
                            propertyManagedObject.image_URL = property.image_URL
                            propertyManagedObject.estate = property.estate
                            propertyManagedObject.bedrooms = Int64(property.bedrooms)
                            propertyManagedObject.gross_area = Int64(property.gross_area)
                            propertyManagedObject.expected_tenants = Int64(property.expected_tenants)
                            propertyManagedObject.h_Property = property.h_Property
                            do{
                                try managedObjectContext.save()
                            }catch{
                                print("Could not save \(error)")
                            }
                        }
                    }
                }
            }){ (error) in
            DispatchQueue.main.async {
                print("Error")
            }
        }
    }
}

import Foundation
import MapKit

class EstateLocations {
    
    var title: String?
    let estate: String
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        estate: String,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        
        self.estate = estate
        self.coordinate = coordinate
    }
    
}
extension EstateLocations {
//    
//    static let campusBuildings: [EstateLocations] = [
//        EstateLocations(title: "", estate: "Heng Fa Chuen",
//                 coordinate: CLLocationCoordinate2D(latitude: 22.2780, longitude: 114.24049),
//                 EstateLocations(title: "", estate: "Heng Fa Chuen",
//                                 coordinate: CLLocationCoordinate2D(latitude: 22.2780, longitude: 114.24049),
//            
//    ]
    
}

//
//  property.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation
import MapKit

class property: NSObject, MKAnnotation  {
    
    let id: Int
    let property_title: String
    let image_URL: String
    let estate: String
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return "\(property_title), \(estate) estate"
    }
    
    init(
        id: Int,
        property_title: String,
        estate: String,
        image_URL: String,
        coordinate: CLLocationCoordinate2D
    ) {
        self.id = id
        self.property_title=property_title
        self.estate=estate
        self.image_URL=image_URL
        self.coordinate=coordinate
        
    }
    
}
extension property {
    
    static let Property: [property] = [
        property(id:1,property_title: "AC Hall",
                 estate: "大學會堂",image_URL: "www.baidu.com",
                         coordinate: CLLocationCoordinate2D(latitude: 22.341280, longitude: 114.179768)),
        property(id:2,property_title: "Lam Woo International Conference Center",
                 estate: "林護國際會議中心",image_URL: "www.baidu.com",
                         coordinate: CLLocationCoordinate2D(latitude: 22.337716, longitude: 114.182013)),
        property(id:3,property_title: "Communication and Visual Arts Building",
                 estate: "傳理大樓",image_URL: "www.baidu.com",
                         coordinate: CLLocationCoordinate2D(latitude: 22.334382, longitude: 114.182528))
            ]
    
}

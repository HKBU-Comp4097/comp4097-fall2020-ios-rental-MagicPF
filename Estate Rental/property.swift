//
//  property.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation
import MapKit

struct property {
    
    let id: Int
    let property_title: String
    let estate:String
    let image_URL: String
//    let coordinate: CLLocationCoordinate2D

    
}
extension property :Decodable{
    
    static var Property: [property] = {
            do {
                guard let rawEventData =
                    try? Data(contentsOf: Bundle.main.bundleURL.appendingPathComponent("Property.json")) else {
                        return []
                }
                return try JSONDecoder().decode([property].self, from: rawEventData)
                
            } catch {
                print("events.json was not found or is not decodable.")
            }
            return []
        }()
    
}

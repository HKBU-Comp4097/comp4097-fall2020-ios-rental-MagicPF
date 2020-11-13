//
//  NetworkController.swift
//  Estate Rental
//
//  Created by 潘丰 on 13/11/2020.
//

import Foundation
class NetworkController {
    func fetchNews(completionHandler: @escaping ([Property]) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        
        let url = URL(string: "https://morning-plains-00409.herokuapp.com/property/json")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Server error encountered
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode < 300 else {
                    // Client error encountered
                    errorHandler(nil)
                    return
            }
            
            guard let data = data, let property =
                try? JSONDecoder().decode([Property].self, from: data) else {
                    errorHandler(nil)
                    return
            }
            print(data)
            // Call our completion handler with our news
            completionHandler(property)
        }
        
        task.resume()
    }
    func fetchImage(for imageUrl: String, completionHandler: @escaping (Data) -> (),
                    errorHandler: @escaping (Error?) -> ()) {
        
        let url = URL(string: imageUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Server error encountered
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode < 300 else {
                    // Client error encountered
                    errorHandler(nil)
                    return
            }
            
            guard let data = data else {
                errorHandler(nil)
                return
            }
            
            // Call our completion handler with our news
            completionHandler(data)
        }
        
        task.resume()
    }
}

struct Property: Codable {
    let createdAt:Int
    let updatedAt:Int
    let id: Int
    let property_title : String
    let image_URL:String
    let estate: String
    let bedrooms: Int
    let gross_area:Int
    let expected_tenants : Int
    let rent:Int
    let h_Property:String
}


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
    func Login(username:String,password:String,completionHandler: @escaping (NUser) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        let url = URL(string:"https://morning-plains-00409.herokuapp.com/user/login")
                var request = URLRequest.init(url: url!)
                request.httpMethod = "POST"
        print("Login information username:\(username) password: \(password)")
        let address = "username="+username+"&password="+password
                request.httpBody = address.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Server error encountered
                errorHandler(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                    // Client error encountered
                
                    errorHandler(nil)
                    return
            }
            guard let data = data, let myuser =
                try? JSONDecoder().decode(NUser.self, from: data) else {
                    errorHandler(nil)
                    return
            }
            print("The data are \(data)")
            // Call our completion handler with our news
            completionHandler(myuser)
        }
        
        task.resume()
    }
    
    func MoveIN(fk:Int,method:String,completionHandler: @escaping (Int) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        let url = URL(string:"https://morning-plains-00409.herokuapp.com/user/rent/\(fk)")
                var request = URLRequest.init(url: url!)
                request.httpMethod = method
        print("MOVEIN REQUEST: \(request)")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
                response.statusCode != 404 else {
                print("OOPSSSSSSSSSSSSSSS")
                errorHandler(nil)
                    return
            }
            print("The response is \(response.statusCode)")
            completionHandler(response.statusCode)
        }
        task.resume()
    }
    func fetchMyRentals(completionHandler: @escaping ([Property]) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        
        let url = URL(string: "https://morning-plains-00409.herokuapp.com/user/MyRentals")!
        
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
    func Logout(completionHandler: @escaping (Int) -> (),
                        errorHandler: @escaping (Error?) -> ()) {
        let url = URL(string:"https://morning-plains-00409.herokuapp.com/user/logout")
                var request = URLRequest.init(url: url!)
                request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
                response.statusCode < 500 else {
                errorHandler(nil)
                    return
            }
            print("The Logout response is \(response.statusCode)")
            completionHandler(response.statusCode)
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
struct NUser: Codable{
    let createdAt: Int
    let updatedAt: Int
    let id: Int
    let username :String
    let role: String
    let avatar: String
}

//
//  EstateOpt.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation

struct User {
    let createdAt: Int
    let updatedAt: Int
    var id: Int
    var username :String
    let password:    String
    let role : String
    var avatar: String
}

extension User {
    
    static var currentUser = User(createdAt: -1, updatedAt: -1, id: -1, username: "username", password: "password", role: "everyone", avatar: "")
}

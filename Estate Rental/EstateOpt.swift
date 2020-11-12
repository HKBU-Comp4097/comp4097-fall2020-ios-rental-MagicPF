//
//  EstateOpt.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation

struct EstateOpt {
    let id:Int
    let title: String
}

extension EstateOpt {
    
    static let sampleData: [EstateOpt] = [
        EstateOpt(id:1,title: "德福地产"),
        EstateOpt(id:2,title: "淘大地产"),
        EstateOpt(id:3,title: "德宝地产"),
        EstateOpt(id:4,title: "汤臣地产"),
    ]
}

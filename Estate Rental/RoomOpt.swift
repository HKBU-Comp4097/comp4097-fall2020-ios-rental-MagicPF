//
//  EstateOpt.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation

struct RoomOpt {
    let id:Int
    let title: String
    let query:Int
}

extension RoomOpt {
    
    static let sampleData: [RoomOpt] = [
        RoomOpt(id:1,title: "Room > 3",query:3),
        RoomOpt(id:2,title: "Room < 2",query:-2),
        RoomOpt(id:3,title: "Room > 4",query:4),
        RoomOpt(id:4,title: "Room < 5",query:-5),
    ]
}

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
    let minValue:Int
    let maxValue:Int
}

extension RoomOpt {
    
    static let sampleData: [RoomOpt] = [
        RoomOpt(id:1,title: "Room > 3",minValue:3,maxValue:10),
        RoomOpt(id:2,title: "Room < 3",minValue:1,maxValue:2),
        RoomOpt(id:3,title: "Room = 3",minValue:3,maxValue:3),
        RoomOpt(id:4,title: "Room > 4",minValue:4,maxValue:10)
    ]
}

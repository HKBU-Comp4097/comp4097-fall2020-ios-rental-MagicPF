//
//  EstateOptions.swift
//  Estate Rental
//
//  Created by 潘丰 on 12/11/2020.
//

import Foundation

struct EstateOpt {
    let title: String
    let code: String
    let logo: String
}

extension Dept {
    
    static let sampleData: [Dept] = [
        Dept(title: "Computer Science", code: "comp", logo: "comp_logo"),
        Dept(title: "Communication Studies", code: "coms", logo: "coms_logo")
    ]
}

//
//  ActivityModel.swift
//  Activities
//
//  Created by Valentina Russo on 17/02/23.
//

import Foundation

struct Activity: ActivityServiceProtocol, Identifiable{
    let id = UUID()
    var domain: [String]
    var title: String
    var description: String
    var instruction: String
    var rating: Int
}

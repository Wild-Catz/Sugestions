//
//  Activity.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

typealias ActivityID = Int
typealias Tip = String
typealias Need = String

struct ActivityAPI {
    let id: ActivityID
    let name: String
    let description: String
    let tips: [Tip]
    let need: String
    let difficult: Difficult
    let categories: Set<Category>
}

struct Activity {
    let id: ActivityID
    let name: String
    let description: String
    let tips: [Tip]
    let need: String
    let category: Category
    var isDone: Bool
}

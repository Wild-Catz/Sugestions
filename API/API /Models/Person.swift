//
//  Person.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation
typealias PersonID = Int

struct Person {
    let id: PersonID
    let name: String
    let categories: Set<Category>
    let history: [History]
}

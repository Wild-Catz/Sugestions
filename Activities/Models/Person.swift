//
//  Person.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

typealias PersonID = Int

struct OnboardingPerson: Codable {
    let name: String
    let categories: Set<Category>
    let feedback: Feedback
    let gender: Gender
}

struct Person: Codable {
    let id: PersonID
    let gender: Gender
    let name: String
    let categories: Set<Category>
    let history: [History]
}

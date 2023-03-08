//
//  Person.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation
typealias PersonID = Int

enum Gender: String, Codable {
    case male
    case female
    case none
}

struct OnboardingPerson: Codable {
    let name: String
    let categories: Set<Category>
    let feedback: [QuestionID: Mark]
    let gender: Gender
}

struct Person: Codable {
    let id: PersonID
    let gender: Gender
    let name: String
    let categories: Set<Category>
    let history: [History]
}

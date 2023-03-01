//
//  Feedback.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

struct Question: Hashable, Codable {
    let text: String
    let category: Category
}

typealias Feedback = [Question: Mark]

//
//  Feedback.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

typealias QuestionID = Int

struct Question: Hashable, Codable {
    let id: QuestionID
    let text: String
    let category: Category
}

typealias Feedback = [QuestionID: Mark]

//
//  Category.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

enum Category: String, CaseIterable, Codable {
    case receptive
    case expressive
    case problemSolving
    case fineMotory
    
    static func completeStrings(str: Category) -> String {
        switch str {
        case receptive:
            return "Receptive \nlanguage"
        case expressive:
            return "Expressive \nlanguage"
        case problemSolving:
            return "Problem \nsolving"
        case fineMotory:
            return "Motor \nabilities"
        }
    }
}

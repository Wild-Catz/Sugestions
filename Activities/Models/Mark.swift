//
//  Mark.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

enum Mark: Int, Codable, CaseIterable {
    case tooBad = -3
    case bad = -2
    case normal = 0
    case good = 1
    case excelent = 2
    
    static func fiveSystem(from: Int) -> Mark {
        switch from {
        case 1:
            return .tooBad
        case 2:
            return .bad
        case 3:
            return .normal
        case 4:
            return .good
        case 5:
            return .excelent
        default:
            return .normal
        }
    }
}

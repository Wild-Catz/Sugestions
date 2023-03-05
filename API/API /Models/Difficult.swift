//
//  Difficult.swift
//  Activities
//
//  Created by Roman Gorbenko on 27/02/23.
//

import Foundation

struct Difficult: Codable {
    let receptive: Int
    let expressive: Int
    let problemSolving: Int
    let fineMotory: Int

    public func getDifficult(category: Category) -> Int {
        switch category {
        case .fineMotory:
            return fineMotory
        case .expressive:
            return expressive
        case .problemSolving:
            return problemSolving
        case .receptive:
            return receptive
        }
    }
    
    func difficultDict() -> [Category: Int] {
        return [.receptive: receptive,
                .expressive: expressive,
                .problemSolving: problemSolving,
                .fineMotory: fineMotory]
    }
}

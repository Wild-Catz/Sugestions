//
//  Day.swift
//  Activities
//
//  Created by Roman Gorbenko on 01/03/23.
//

import Foundation

struct Day: Codable {
    let activity: ActivityAPI
    let category: Category
    var isDone: Bool
    let generatedTime: Date
}

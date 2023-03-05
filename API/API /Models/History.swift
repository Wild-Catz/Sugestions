//
//  History.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

struct History: Codable {
    let activityId: ActivityID
    let category: Category
    let rate: Feedback
}

//
//  Activity.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

typealias ActivityID = Int

struct Activity {
    let id: ActivityID
    let name: String
    let description: String
    let rate: Rating
}

//
//  GetActivityResponse.swift
//  Activities
//
//  Created by Roman Gorbenko on 05/03/23.
//

import Foundation

struct ActivityAPI: Codable {
    let id: ActivityID
    let name: String
    let description: String
    let tips: [Tip]
    let need: String
    let difficult: Difficult
    let categories: Set<Category>
}

struct GetActivityResponse: Decodable {
    let activity: ActivityAPI
    let isDone: Bool
    let categoryOfTheDay: Category
}

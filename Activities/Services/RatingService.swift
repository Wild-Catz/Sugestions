//
//  RatingService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

private enum Const {
    static let udKey = "C:"
    static let def = 7
    static let min = 0
    static let max = 15
}

protocol RatingServiceProtocol {
    func rateActivity(activity: Activity, feedback: Feedback)
    func getCategoryRating(category: Category) -> Int
}

final class RatingService {
    let ud = UserDefaults(suiteName: Const.udKey)

    private func getRate(category: Category) -> Int {
        return ud?.object(forKey: category.rawValue) as? Int ?? Const.def
    }

    private func changeRate(category: Category, mark: Mark) {
        var rate = getRate(category: category)
        rate += mark.rawValue
        if rate > Const.max { rate = Const.max }
        if rate < Const.min { rate = Const.min }
        ud?.set(rate, forKey: category.rawValue)
    }
}

extension RatingService: RatingServiceProtocol {
    func getCategoryRating(category: Category) -> Int {
        getRate(category: category)
    }

    func rateActivity(activity: Activity, feedback: Feedback) {
        feedback.forEach { key, mark in
            changeRate(category: key.category, mark: mark)
        }
    }
}

//
//  RatingService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

private enum Const {
    static let def = 7
    static let min = 0
    static let max = 15
}

protocol RatingServiceProtocol {
    func rateActivity(activity: ActivityID, feedback: Feedback)
    func getCategoryRating(category: Category) -> Int
    func getAllCategoriesRating() -> [Category: Int]
}

final class RatingService {
    let ud = UserDefaultsManager()
    var rating: [Category: Int]
    
    init() {
        self.rating = ud.load([Category:Int].self, forKey: "rating") ?? Self.dict
    }
    
    private func getRate(category: Category) -> Int {
        return rating[category]!
    }

    private func changeRate(category: Category, mark: Mark) {
        var rate = getRate(category: category)
        rate += mark.rawValue
        if rate > Const.max { rate = Const.max }
        if rate < Const.min { rate = Const.min }
        rating[category] = rate
        ud.save(rating, forKey: "rating")
    }
}

extension RatingService: RatingServiceProtocol {
    func getAllCategoriesRating() -> [Category: Int] {
        rating
    }
    
    func getCategoryRating(category: Category) -> Int {
        getRate(category: category)
    }

    func rateActivity(activity: ActivityID, feedback: Feedback) {
        feedback.forEach { key, mark in
            changeRate(category: key.category, mark: mark)
        }
    }
}

extension RatingService {
    static var dict: [Category: Int] = [
        .problemSolving: 7, .expressive: 7, .fineMotory: 7, .receptive: 7
    ]
}

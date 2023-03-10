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
    func setupRatingSystem(with feedback: Feedback)
    func getAllCategoriesRating() -> [Category: Int]
}

final class RatingService {
    let ud = UserDefaultsManager()
    var dict: [Category: Int] {
        get {
            let dict = ud.load([Category: Int].self, forKey: "rating") ?? Self.defaultDifficulties
            print(dict)
            return dict
        }
        set { ud.save(newValue, forKey: "rating") }
    }
    
    private func setRate(category: Category, rating: Int) {
        dict[category] = rating
    }
    
    private func getRate(category: Category) -> Int {
        dict[category]!
    }

    private func changeRate(category: Category, mark: Mark) {
        var rate = getRate(category: category)
        rate += mark.rawValue
        if rate > Const.max { rate = Const.max }
        if rate < Const.min { rate = Const.min }
        dict[category] = rate
        ud.save(dict, forKey: "rating")
    }
}

extension RatingService: RatingServiceProtocol {
    func getAllCategoriesRating() -> [Category : Int] {
        self.dict
    }
    
    func setupRatingSystem(with feedback: Feedback) {
        Category.allCases.forEach { category in
            setRate(
                category: category,
                rating: feedback
                    .filter {
                        $0.key.category == category
                    }
                    .map { $0.value }
                    .map { $0.rawValue + 3 }
                    .reduce(0, +)
            )
            
        }
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
    static var defaultDifficulties: [Category: Int] = [
        .problemSolving: 3, .expressive: 1, .fineMotory: 4, .receptive: 3
    ]
}

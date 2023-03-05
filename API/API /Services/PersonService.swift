//
//  PersonService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

protocol PersonServiceProtocol {
    func getPerson(with id: PersonID) -> Person
    func setDoneExercise(activity: ActivityID, category: Category, feedback: Feedback)
    func getCategoryRating(category: Category) -> Int
}

final class FakePersonService {
    let ud = UserDefaultsManager()
    let name: String
    let ratingService: RatingServiceProtocol
    var categories: Set<Category>
    var history: [History]

    init(ratingService: RatingServiceProtocol) {
        if ud.load(Bool.self, forKey: "first_launch") == nil {
            ud.save(Set<Category>.init(arrayLiteral: .expressive, .fineMotory, .problemSolving, .receptive), forKey: "categories")
        }
        self.name = ud.load(String.self, forKey: "name") ?? "Frencesco"
        self.categories = ud.load(Set<Category>.self, forKey: "categories") ?? Set<Category>()
        self.history = ud.load([History].self, forKey: "history") ?? []
        self.ratingService = ratingService
    }
}

extension FakePersonService: PersonServiceProtocol {
    func getPerson(with id: PersonID) -> Person {
        Person(id: 3, name: name, categories: categories, history: self.history)
    }
    
    func getPerson() -> Person {
        return Person(id: 3, name: name, categories: categories, history: self.history)
    }

    func setDoneExercise(activity: ActivityID, category: Category, feedback: Feedback) {
        ratingService.rateActivity(activity: activity, feedback: feedback)
        self.history.append(.init(activityId: activity, category: category, rate: feedback))
        ud.save(self.history, forKey: "history")
    }
    
    func getCategoryRating(category: Category) -> Int {
        return ratingService.getCategoryRating(category: category)
    }

}

//
//  PersonService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

protocol PersonServiceProtocol {
    func getPerson(with id: PersonID) -> Person
    func savePerson(person: Person, feedback: Feedback)
    func setDoneExercise(activity: ActivityID, category: Category, feedback: Feedback)
    func getCategoryRating(category: Category) -> Int
    func getAllCategoriesRating() -> [Category: Int]
}

final class FakePersonService {
    let ud = UserDefaultsManager()
    let ratingService: RatingServiceProtocol
    var person: Person

    init(ratingService: RatingServiceProtocol) {
        if ud.load(Bool.self, forKey: "first_launch") == nil {
            ud.save(Set<Category>.init(arrayLiteral: .expressive, .fineMotory, .problemSolving, .receptive), forKey: "categories")
        }
        self.person = ud.load(Person.self, forKey: "person") ?? Self.defaultPerson
        self.ratingService = ratingService
    }
}

extension FakePersonService: PersonServiceProtocol {
    func getAllCategoriesRating() -> [Category : Int] {
        ratingService.getAllCategoriesRating()
    }
    
    func savePerson(person: Person, feedback: Feedback) {
        let onPerson = Person(id: 0, gender: person.gender, name: person.name, categories: person.categories, history: [])
        ud.save(onPerson, forKey: "person")
        self.ratingService.setupRatingSystem(with: feedback)
    }
    
    func getPerson(with id: PersonID) -> Person {
        self.person
    }
    
    func getPerson() -> Person {
        self.person
    }

    func setDoneExercise(activity: ActivityID, category: Category, feedback: Feedback) {
        ratingService.rateActivity(activity: activity, feedback: feedback)
        var history = person.history
        history.append(.init(activityId: activity, category: category, rate: feedback))
        self.person = Person(id: person.id, gender: person.gender, name: person.name, categories: person.categories, history: history)
        ud.save(person, forKey: "person")
    }
    
    func getCategoryRating(category: Category) -> Int {
        return ratingService.getCategoryRating(category: category)
    }
}

extension FakePersonService {
    static let defaultPerson = Person(id: 444, gender: .male, name: "Default", categories: .init(), history: [])
}

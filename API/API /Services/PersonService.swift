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
    var person: Person {
        get { ud.load(Person.self, forKey: "person") ?? Self.defaultPerson }
        set { ud.save(newValue, forKey: "person") }
    }

    init(ratingService: RatingServiceProtocol) {
        self.ratingService = ratingService
    }
}

extension FakePersonService: PersonServiceProtocol {
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
        ratingService.getCategoryRating(category: category)
    }
    
    func getAllCategoriesRating() -> [Category: Int] {
        ratingService.getAllCategoriesRating()
    }
}

extension FakePersonService {
    static let defaultPerson = Person(id: 444, gender: .male, name: "Default", categories: .init(), history: [])
}

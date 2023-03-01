//
//  PersonService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

protocol PersonServiceProtocol {
    func getPerson() -> Person
    func setWishCatgories(categories: Set<Category>)
}

final class FakePersonService {
    let ud = UserDefaultsManager()
    let name: String
    var categories: Set<Category>
    var history: [History]

    init() {
        name = ud.load(String.self, forKey: "name") ?? ""
        categories = ud.load(Set<Category>.self, forKey: "categories") ?? Set<Category>()
        history = ud.load([History].self, forKey: "history") ?? []
    }
}

extension FakePersonService: PersonServiceProtocol {
    func getPerson() -> Person {
        Person(name: name, categories: categories, history: [])
    }

    func setWishCatgories(categories: Set<Category>) {
        self.categories = categories
    }
}
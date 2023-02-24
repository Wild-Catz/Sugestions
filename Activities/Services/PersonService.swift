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
    let ud = UserDefaults()
    let name: String
    var categories: Set<Category>
    var history: [History]

    init() {
        name = ud.object(forKey: "name") as? String ?? ""
        categories = ud.object(forKey: "categories") as? Set<Category> ?? Set<Category>()
        history = ud.object(forKey: "history") as? [History] ?? []
    }
}

extension FakePersonService: PersonServiceProtocol {
    func getPerson() -> Person {
        Person(name: "Francesco", categories: categories, history: [])
    }

    func setWishCatgories(categories: Set<Category>) {
        self.categories = categories
    }
}

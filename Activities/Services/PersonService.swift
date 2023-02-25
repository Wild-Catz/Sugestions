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
    func isFirstLaunch() -> Bool
}

final class FakePersonService {
    let ud = UserDefaultsManager()

    init() {
        if (isFirstLaunch()) {
            setWishCatgories(categories: .init(arrayLiteral: .expressive, .fineMotory, .receptive, .problemSolving))
        }
    }
}

extension FakePersonService: PersonServiceProtocol {
    func getPerson() -> Person {
        let name = ud.load(String.self, forKey: "name") ?? "Francesco"
        let categories = ud.load(Set<Category>.self, forKey: "categories") ?? Set<Category>()
        let history = ud.load([History].self, forKey: "history") ?? []
        return Person(name: name, categories: categories, history: history)
    }

    func setWishCatgories(categories: Set<Category>) {
        ud.save(categories, forKey: "categories")
    }

    func isFirstLaunch() -> Bool {
        ud.load(Bool.self, forKey: "firstLaunch") ?? true
    }

}

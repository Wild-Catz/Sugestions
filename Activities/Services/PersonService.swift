//
//  PersonService.swift
//  Activities
//
//  Created by Roman Gorbenko on 05/03/23.
//

import Foundation
import API

protocol PersonServiceProtocol {
    func getPerson(with id: Int) -> Person
    func createPerson()
}

final class PersonService {
    let id: Int?
    let ud = UserDefaultsManager()
    let apiLayer: APIServiceProtocol
    
    init(api: APIServiceProtocol) {
        self.apiLayer = api
        self.id = ud.load(Int.self, forKey: "person")
    }
}

extension PersonService: PersonServiceProtocol {
    func getPerson(with id: Int) -> Person {
        Person(id: 0, name: "Some", categories: .init(arrayLiteral: .expressive), history: [], gender: .none)
    }
    
    func createPerson() {
        
    }
}

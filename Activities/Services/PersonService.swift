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
    func createPerson(onboardingPerson: OnboardingPerson)
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
    func createPerson(onboardingPerson: OnboardingPerson) {
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(onboardingPerson)
        apiLayer.saveUser(userData: data)
    }
    
    func getPerson(with id: Int) -> Person {
        let jsonDecoder = JSONDecoder()
        return try! jsonDecoder.decode(Person.self, from: apiLayer.getPerson())
    }
    
    
}

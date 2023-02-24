//
//  ActivityService.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

private enum Const {
    static let udKey = "C:"
}

protocol ActivityServiceProtocol {
    func getActivity() -> Activity
    func rateActivity(activity: Activity, feedback: Feedback)
}

final class FakeActivityService {
    let apiService: APIServiceProtocol
    let personService: PersonServiceProtocol

    init(personService: PersonServiceProtocol, apiService: APIServiceProtocol) {
        self.apiService = apiService
        self.personService = personService
    }
}

extension FakeActivityService: ActivityServiceProtocol {
    func getActivity() -> Activity {
        apiService.getActivity(for: personService.getPerson())
    }

    func rateActivity(activity: Activity, feedback: Feedback) {
        apiService.rateActivity(activity, with: feedback, for: personService.getPerson())
    }
}

//
//  ActivityService.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

protocol ActivityServiceProtocol {
    func getActivity() -> Activity
    func rateActivity(activity: Activity, feedback: Feedback)
    func getQuestions(activity: Activity) -> [Question]
}

final class FakeActivityService {
    private let apiService: APIServiceProtocol
    private let personService: PersonServiceProtocol
    private var storedActivity: Activity?

    init(personService: PersonServiceProtocol, apiService: APIServiceProtocol) {
        self.apiService = apiService
        self.personService = personService
    }
}

extension FakeActivityService: ActivityServiceProtocol {
    func getActivity() -> Activity {
        if let activity = self.storedActivity {
            return activity
        } else {
            let activity = apiService.getActivity(for: personService.getPerson())
            self.storedActivity = activity
            return activity
        }
    }

    func rateActivity(activity: Activity, feedback: Feedback) {
        apiService.rateActivity(activity, with: feedback, for: personService.getPerson())
    }
    
    func getQuestions(activity: Activity) -> [Question] {
        apiService.getQuestions(for: activity)
    }
}

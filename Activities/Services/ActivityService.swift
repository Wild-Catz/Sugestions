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
    func getOnboardingQuestions() -> [String]
    var shouldShowBanner: Bool { get set }

}

final class FakeActivityService {
    private let apiService: APIServiceProtocol
    private let personService: PersonServiceProtocol
    private var banner: Bool = false

    init(personService: PersonServiceProtocol, apiService: APIServiceProtocol) {
        self.apiService = apiService
        self.personService = personService
    }
}

extension FakeActivityService: ActivityServiceProtocol {
    var shouldShowBanner: Bool {
        get { banner }
        set { banner = newValue }
    }
    
    func getActivity() -> Activity {
            let response = apiService.getActivity(for: personService.getPerson())
            let activity = Activity(id: response.activity.id,
                                    name: response.activity.name,
                                    description: response.activity.description,
                                    tips: response.activity.tips,
                                    need: response.activity.need,
                                    category: response.categoryOfTheDay,
                                    isDone: response.isDone)
            return activity
    }

    func rateActivity(activity: Activity, feedback: Feedback) {
        apiService.rateActivity(activity, with: feedback, for: personService.getPerson())
        self.shouldShowBanner = true
    }
    
    func getQuestions(activity: Activity) -> [Question] {
        apiService.getQuestions(for: activity)
    }
    
    func getOnboardingQuestions() -> [String] {
        apiService.getOnboardingQuestions()
    }
}

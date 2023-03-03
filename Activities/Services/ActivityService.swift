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
    var shouldShowBanner: Bool { get set }

}

final class FakeActivityService {
    private let apiService: APIServiceProtocol = APIService(personService: FakePersonService(ratingService: RatingService()))
    private let personService: PersonServiceProtocol = FakePersonService(ratingService: RatingService())
    private var banner: Bool = false

}

extension FakeActivityService: ActivityServiceProtocol {
    var shouldShowBanner: Bool {
        get { banner }
        set { banner = newValue }
    }
    
    func getActivity() -> Activity {
        let person = personService.getPerson()
        let response = apiService.getActivity(for: person)
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
        apiService.rateActivity(activity.id, with: feedback, for: personService.getPerson())
        self.shouldShowBanner = true
    }
    
    func getQuestions(activity: Activity) -> [Question] {
        apiService.getQuestions(for: activity.id)
    }
}

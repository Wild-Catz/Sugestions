//
//  ActivityService.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation
import API

protocol ActivityServiceProtocol: AnyObject {
    func getActivity(for personID: PersonID) -> Activity
    func rateActivity(activity: Activity, for personID: PersonID, feedback: Feedback)
    func getQuestions(activity: Activity) -> [Question]
    func getOnboardingQuestions() -> [Question]
    var shouldShowBanner: Bool { get set }
}

final class FakeActivityService {
    private let apiService: APIServiceProtocol
    private var banner: Bool = false
    
    init(api: APIServiceProtocol) {
        self.apiService = api
    }
}

extension FakeActivityService: ActivityServiceProtocol {
    func getOnboardingQuestions() -> [Question] {
        let response = apiService.getOnboardingQuestions()
        let decoder = JSONDecoder()
        return try! decoder.decode([Question].self, from: response)
    }
    
    var shouldShowBanner: Bool {
        get { banner }
        set { banner = newValue }
    }
    
    func getActivity(for personID: PersonID) -> Activity {
        let response = apiService.getActivity(for: personID)
        let decoder = JSONDecoder()
        let decoded = try! decoder.decode(GetActivityResponse.self, from: response)
        let activity = Activity(id: decoded.activity.id,
                                name: decoded.activity.name,
                                description: decoded.activity.description,
                                tips: decoded.activity.tips,
                                need: decoded.activity.need,
                                category: decoded.categoryOfTheDay,
                                isDone: decoded.isDone)
        return activity
    }

    func rateActivity(activity: Activity, for personID: PersonID, feedback: Feedback) {
        let feedback = Dictionary(uniqueKeysWithValues: feedback.map { key, value in
            ( key, value.rawValue)
        })
        apiService.rateActivity(activity.id, with: feedback, for: personID)
        self.shouldShowBanner = true
    }
    
    func getQuestions(activity: Activity) -> [Question] {
        let response = apiService.getQuestions(for: activity.id)
        let decoder = JSONDecoder()
        return try! decoder.decode([Question].self, from: response)
    }
}

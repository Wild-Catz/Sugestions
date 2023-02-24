//
//  APIService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

protocol APIServiceProtocol {
    func getActivity(for profile: Person) -> Activity
    func rateActivity(_ activity: Activity, with feedback: Feedback, for profile: Person)
}

final class APIService: APIServiceProtocol {
    let ratingService: RatingServiceProtocol

    init(ratingService: RatingServiceProtocol) {
        self.ratingService =  ratingService
    }

    func getActivity(for profile: Person) -> Activity {
        let categories = profile.categories
        let history = profile.history
        let lastdays = history.suffix(categories.count - 1).map { $0.category }
        let category = categories.filter { category in
            !lastdays.contains(where: { $0 == category })
        }
        .map {
            (ratingService.getCategoryRating(category: $0), $0)
        }
        .sorted(by: { $0.0 > $1.0 })
        .first?.1
        if let category = category {
            return suggestActivity(in: category, for: profile)
        } else {
            return Self.errorActivity
        }
    }

    func rateActivity(_ activity: Activity, with feedback: Feedback, for profile: Person) {
        ratingService.rateActivity(activity: activity, feedback: feedback)
    }

    private func suggestActivity(in category: Category, for profile: Person) -> Activity {
        let activity = getActivities(in: category, max: ratingService.getCategoryRating(category: category)).randomElement()
        return activity ?? Self.activities[0]
    }

    private func getActivities(in category: Category, max rating: Int) -> [Activity] {
        getActivities(in: category)
    }

    private func getActivities(in category: Category) -> [Activity] {
        return Self.activities.filter { $0.categories.keys.contains(category) }
    }

}

extension APIService {
    private static let activities: [Activity] = [
        .init(id: 0, name: "First Activity", description: "I dont know now", categories: [.fineMotory: 4]),
        .init(id: 1, name: "Second Activity", description: "I Gay maybe", categories: [.expressive: 6])
    ]

    private static let errorActivity: Activity = .init(id: 404, name: "Error Activity", description: "Error Description", categories: [.problemSolving: 2])
}

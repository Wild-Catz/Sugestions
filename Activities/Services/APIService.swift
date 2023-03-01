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
    func getQuestions(for activity: Activity) -> [Question]
}

final class APIService {
    let ratingService: RatingServiceProtocol

    init(ratingService: RatingServiceProtocol) {
        self.ratingService =  ratingService
    }

    private func suggestActivity(in category: Category) -> Activity {
        let activity = getActivities(in: category).randomElement()
        return activity ?? Self.errorActivity
    }
    
    private func getActivities(in category: Category) -> [Activity] {
        let currentRatings = RatingService.dict
        return Self.activities
            .filter { $0.categories.contains(category) }
        
            .filter { $0.difficult.difficultDict().allSatisfy {
                currentRatings[$0.key]! >= $0.value
            } }
            .sorted { act1, act2 -> Bool in
                act1.difficult.getDifficult(category: category) < act2.difficult.getDifficult(category: category)
            }
    }
}

extension APIService: APIServiceProtocol {
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
        .sorted { $0.0 < $1.0 }
        .first?.1
        if let category = category {
            return suggestActivity(in: category)
        } else {
            return Self.errorActivity
        }
    }

    func rateActivity(_ activity: Activity, with feedback: Feedback, for profile: Person) {
        ratingService.rateActivity(activity: activity, feedback: feedback)
    }
    
    func getQuestions(for activity: Activity) -> [Question] {
        Self.questions.filter { activity.categories.contains($0.category) }
    }
}

extension APIService {
    private static let questions: [Question] = [
        .init(text: "receptive_question_feedback", category: .receptive),
        .init(text: "expressive_question_feedback", category: .expressive),
        .init(text: "problemSolving_question_feedback", category: .problemSolving),
        .init(text: "fineMotory_question_feedback", category: .fineMotory)
    ]
    
    private static let activities: [Activity] = [
        .init(id: 0,
              name: "First Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 4),
              categories: .init(arrayLiteral: .receptive)),
        .init(id: 1,
              name: "Second Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving, .expressive)
             ),
        .init(id: 2,
              name: "Third Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 1, expressive: 3, problemSolving: 4, fineMotory: 5),
              categories: .init(arrayLiteral: .fineMotory, .problemSolving)
             ),
        .init(id: 3,
              name: "Fourth Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 3, expressive: 3, problemSolving: 1, fineMotory: 2),
              categories: .init(arrayLiteral: .fineMotory, .receptive, .problemSolving)
            ),
        .init(id: 4,
              name: "Fifth Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 5, expressive: 3, problemSolving: 2, fineMotory: 1),
              categories: .init(arrayLiteral: .expressive, .fineMotory, .receptive)
             )
    ]

    private static let errorActivity: Activity = .init(id: 404,
                                                       name: "Error Activity",
                                                       description: "Error description",
                                                       tips: ["Error"],
                                                       need: "Error",
                                                       difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
                                                       categories: .init(arrayLiteral: .receptive, .fineMotory))
}

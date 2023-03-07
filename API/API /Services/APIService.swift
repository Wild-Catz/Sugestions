//
//  APIService.swift
//  Activities
//
//  Created by Roman Gorbenko on 23/02/23.
//

import Foundation

struct GetActivityResponse: Encodable {
    let activity: ActivityAPI
    let isDone: Bool
    let categoryOfTheDay: Category
}

public protocol APIServiceProtocol {
    func getActivity(for profileID: Int) -> Data
    func rateActivity(_ activity: Int, with feedback: [Int: Int], for profile: Int)
    func getQuestions(for activity: Int) -> Data
    func getOnboardingQuestions() -> Data
}

public final class APIService {
    let ud = UserDefaultsManager()
    let personService: PersonServiceProtocol = FakePersonService(ratingService: RatingService())
    var today: Day?
    
    public init() {
        self.today = ud.load(Day.self, forKey: "current")
        if let time = today?.generatedTime,
           DateInterval(start: time, end: Date()).duration > 30 {
            today = nil
        }
    }
    
    deinit {
        ud.save(today!, forKey: "current")
    }

    private func suggestActivity(in category: Category) -> ActivityAPI {
        let activity = getActivities(in: category).randomElement()
        return activity ?? Self.errorActivity
    }
    
    private func ppp(profile: Person) {
        let categories = profile.categories
        let history = profile.history
        let lastdays = history.suffix(categories.count - 1).map { $0.category }
        let category = categories.filter { category in
            !lastdays.contains(where: { $0 == category })
        }
            .map {
                (personService.getCategoryRating(category: $0), $0)
            }
            .sorted { $0.0 < $1.0 }
            .first?.1
        if let category = category {
            self.today = Day(activity: suggestActivity(in: category), category: category, isDone: false, generatedTime: Date())
            ud.save(today, forKey: "current")
        }
    }
    
    private func getActivities(in category: Category) -> [ActivityAPI] {
        let currentRatings = personService.getAllCategoriesRating()
        print(currentRatings)
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
    public func getOnboardingQuestions() -> Data {
        let response = Self.onboardingQuestions
        let encoder = JSONEncoder()
        return try! encoder.encode(response)
    }
    
    public func getActivity(for profileID: Int) -> Data {
        if let today = self.today,
           today.activity.id != 404 {
            let response = GetActivityResponse(activity: today.activity, isDone: today.isDone, categoryOfTheDay: today.category)
            let encoder = JSONEncoder()
            return try! encoder.encode(response)
            
        } else {
            let profile = personService.getPerson(with: profileID)
            ppp(profile: profile)
            return getActivity(for: profileID)
        }
    }
    
    public func rateActivity(_ activity: Int, with feedback: [Int: Int], for profile: Int) {
        let feedback = Dictionary(uniqueKeysWithValues: feedback.map { key, value in
            (Self.questions[key], Mark(rawValue: value)!)
        })
        if var today = today,
           let activity = Self.activities.first(where: { $0.id == activity }) {
            personService.setDoneExercise(activity: activity.id, category: today.category, feedback: feedback)
            today.isDone = true
            ud.save(today, forKey: "current")
            self.today = today
        }
    }
    
    public func getQuestions(for activity: Int) -> Data {
        let activity = Self.activities.first { $0.id == activity } ?? Self.errorActivity
        let response = Self.questions.filter { activity.categories.contains($0.category) }
        let encoder = JSONEncoder()
        return try! encoder.encode(response)
    }
}

extension APIService {
    private static let questions: [Question] = [
        .init(id: 0, text: "receptive_question_feedback", category: .receptive),
        .init(id: 1, text: "expressive_question_feedback", category: .expressive),
        .init(id: 2, text: "problemSolving_question_feedback", category: .problemSolving),
        .init(id: 3, text: "fineMotory_question_feedback", category: .fineMotory)
    ]
    
    private static let onboardingQuestions: [Question] = [
        .init(id: 1, text: "receptive_onboarding_1", category: .receptive),
        .init(id: 2, text: "receptive_onboarding_2", category: .receptive),
        .init(id: 3, text: "expressive_onboarding_1", category: .expressive),
        .init(id: 4, text: "expressive_onboarding_2", category: .expressive),
        .init(id: 5, text: "problemSolving_onboarding_1", category: .problemSolving),
        .init(id: 6, text: "problemSolving_onboarding_2", category: .problemSolving),
        .init(id: 7, text: "fineMotory_onboarding_1", category: .fineMotory),
        .init(id: 8, text: "fineMotory_onboarding_2", category: .fineMotory)
    ]
    
    private static let activities: [ActivityAPI] = [
        .init(id: 0,
              name: "First Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
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
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
              categories: .init(arrayLiteral: .fineMotory, .problemSolving)
             ),
        .init(id: 3,
              name: "Fourth Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
              categories: .init(arrayLiteral: .fineMotory, .receptive, .expressive)
            ),
        .init(id: 4,
              name: "Fifth Activity",
              description: "I dont know now",
              tips: ["Be gay", "Be whoever you want"],
              need: "You need something maybe",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
              categories: .init(arrayLiteral: .expressive, .fineMotory, .receptive)
             )
    ]
        
        private static let activitiesFemaleEN: [ActivityAPI] = [
            .init(id: 0,
                  name: "First Activity",
                  description: """
                    """,
                  tips: ["", ""],
                  need: "",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 4),
                  categories: .init(arrayLiteral: .problemSolving))
        ]
        
        private static let activitiesMaleIT: [ActivityAPI] = [
            .init(id: 0,
                  name: "First Activity",
                  description: "I dont know now",
                  tips: ["Be gay", "Be whoever you want"],
                  need: "You need something maybe",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 4),
                  categories: .init(arrayLiteral: .receptive))
        ]

    private static let errorActivity: ActivityAPI = .init(id: 404,
                                                       name: "Error Activity",
                                                       description: "Error description",
                                                       tips: ["Error"],
                                                       need: "Error",
                                                       difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 1),
                                                       categories: .init(arrayLiteral: .receptive, .fineMotory))
}

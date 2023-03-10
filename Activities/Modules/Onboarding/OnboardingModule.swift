//
//  OnboardingModule.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI
import API

// swiftlint:disable type_name

private struct OnboardPersonFactory {
    var name: String?
    var categories: Set<Category>?
    var feedback: Feedback?
    var gender: Gender?
    
    func getPerson() -> OnboardingPerson? {
        guard let name = name else { return nil }
        guard let categories = categories else { return nil }
        guard let feedback = feedback else { return nil }
        guard let gender = gender else { return nil }
        return OnboardingPerson(name: name, categories: categories, feedback: feedback, gender: gender)
    }
}

// MARK: - Onboarding Module

final class OnboardingModule: Module {
    @ViewBuilder var rootView: AnyView {
        cordinator.view()
    }
    private let toActivityModule: () -> Void
    private var personFactory: OnboardPersonFactory = OnboardPersonFactory()
    private let personService: PersonServiceProtocol
    private let activityService: ActivityServiceProtocol

    let cordinator: OnboardingCordinator

    init(activityService: ActivityServiceProtocol, personService: PersonServiceProtocol, toActivityModule: @escaping () -> Void) {
        self.personService = personService
        self.activityService = activityService
        self.toActivityModule = toActivityModule
        self.cordinator = OnboardingCordinator()
        self.cordinator.factory = self
    }
}

// MARK: - Routing

extension OnboardingModule: OnboardingScreenFactory {
    func makeStartScreen() -> AnyView {
        let view = OnboardingStartView(vm: OnboardingViewModel { [weak self] in
            self?.cordinator.route(to: \.userDataScreen)
        })
        return AnyView(view)
    }
    
    func makeUserDataScreen() -> AnyView {
        let view = OnboardingUserDataView(
            vm: OnboardingUserDataViewModel(
                onQuestionView: { userName, gender in
                    self.personFactory.name = userName
                    self.personFactory.gender = gender
                    self.cordinator.route(to: \.questionScreen)
                    
                }),
            userName: ""
         )
        return AnyView(view)
    }
    
    func makeQuestionScreen() -> AnyView {
        let view = OnboardingQuestion(vm: OnboardingQuestionViewModel(questions: activityService.getOnboardingQuestions(), onCategoriesView: { feedback in
            self.personFactory.feedback = feedback
            self.cordinator.route(to: \.categoriesScreen)
        }))
        return AnyView(view)
    }
    
    func makeCategoriesScreen() -> AnyView {
        let vm = OnboardingCategoriesViewModel { categories in
            self.personFactory.categories = categories
            self.cordinator.route(to: \.endScreen)
        }
        let view = OnboardingCategoriesView(vm: vm)
        return AnyView(view)
    }
    
    func makeEndScreen() -> AnyView {
        let view = OnboardingEndView(vm: OnboardingEndViewModel { [weak self] in
            let person = self?.personFactory.getPerson()
            guard let person = person else { fatalError() }
            self?.personService.createPerson(onboardingPerson: person)
            self?.toActivityModule()
        })
        return AnyView(view)
    }
}

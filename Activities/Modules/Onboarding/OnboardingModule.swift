//
//  OnboardingModule.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI
import API

// swiftlint:disable type_name

final class OnboardingModule: Module {
    @ViewBuilder var rootView: some View {
        cordinator.view()
    }
    private let activityService = FakeActivityService(api: APIService())
    let cordinator: OnboardingCordinator<OnboardingModule>

    init() {
        self.cordinator = OnboardingCordinator()
        self.cordinator.factory = self

    }
}

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
                onQuestionView: { self.cordinator.route(to: \.questionScreen )}),
            userName: "",
            gender: .none,
            isSelectedF: false,
            isSelectedM: false,
            disableButton: false
         )
        return AnyView(view)
    }
    
    func makeQuestionScreen() -> AnyView {
        let view = OnboardingQuestion(vm: OnboardingQuestionViewModel(questions: activityService.getOnboardingQuestions(), onCategoriesView: {self.cordinator.route(to: \.categoriesScreen )}))
        return AnyView(view)
    }
    
    func makeCategoriesScreen() -> AnyView {
        let view = OnboardingCategoriesView(vm: OnboardingCategoriesViewModel(onEndView: {self.cordinator.route(to: \.endScreen )}), selectedCategories: [(category: .receptive, select: false), (category: .expressive, select: false), (category: .problemSolving, select: false), (category: .fineMotory, select: false)], isDisabled: 0)
        return AnyView(view)
    }
    
    func makeEndScreen() -> AnyView {
        let view = OnboardingEndView(vm: OnboardingEndViewModel())
        return AnyView(view)
    }
}

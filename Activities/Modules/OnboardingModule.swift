//
//  OnboardingModule.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

// swiftlint:disable type_name

final class OnboardingModule: Module {
    private typealias R = Router<RoutingDestination>

    @ViewBuilder var rootView: some View {
        self.presentingView
    }
    private var presentingView: PresentingView<R, OnboardingModule>!
    private let router = R()
    private let activityService = FakeActivityService(personService: FakePersonService(), apiService: APIService(ratingService: RatingService()))
    private let personService = FakePersonService()
    
    init() {
        self.presentingView = PresentingView(router: router, factory: self, root: .start)
    }
}

extension OnboardingModule {
    enum RoutingDestination: RoutingDestinationProtocol {
        case start
        case userData
        case question
        case categories
        case end
    }
}

extension OnboardingModule.RoutingDestination: Identifiable {
    var id: String { "\(self)" }
}

extension OnboardingModule: ScreenFactory {
    @ViewBuilder func view(for destination: RoutingDestination) -> some View {
        switch destination {
        case .start:
            makeStartScreen()
        case .userData:
            makeUserDataScreen()
        case .question:
            makeQuestionScreen()
        case .categories:
            EmptyView()
        case .end:
            EmptyView()
        }
    }

    @ViewBuilder func makeStartScreen() -> some View {
        OnboardingStartView(vm: OnboardingViewModel() { [weak self] in
            self?.router.push(.userData)
        })
    }
                            
    @ViewBuilder func makeUserDataScreen() -> some View {
        OnboardingUserDataView(vm: OnboardingUserDataViewModel(onQuestionView: { self.router.push(.question)
        }), userName: "", gender: .male)
    }
    
    @ViewBuilder func makeQuestionScreen() -> some View {
        OnboardingQuestion(vm: OnboardingQuestionViewModel(onCategoriesView: {})
        )
    }
    typealias RD = RoutingDestination
}

//
//  ActivityModule.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import API
// swiftlint:disable type_name

// MARK: - Module Protocol

protocol Module {
    @ViewBuilder var rootView: AnyView { get }
}

// MARK: - Activity Module

final class ActivityModule: Module {
    @ViewBuilder var rootView: AnyView {
        cordinator.view()
    }
    private let cordinator: MainCordinator
    private let activityService: ActivityServiceProtocol
    private let personService: PersonServiceProtocol
    
    init(activityService: ActivityServiceProtocol, personService: PersonServiceProtocol) {
        self.activityService = activityService
        self.personService = personService
        self.cordinator = MainCordinator()
        self.cordinator.factory = self
    }
}

// MARK: Routing

extension ActivityModule: MainScreenFactory {
    func makeMainScreen() -> AnyView {
        let person = personService.getPerson()
        let activity = activityService.getActivity()
        let vm = MainViewModel(
            person: person,
            activity: activity,
            showCongratulationsBanner: activityService.shouldShowBanner,
            onCongratsClose: { self.activityService.shouldShowBanner = false },
            onDetailsScreen: { self.cordinator.route(to: \.detailsScreen) }
        )
        return AnyView(MainView(viewModel: vm))
    }
    
    func makeDeailedActivityScreen() -> AnyView {
        let vm = ActivityViewModel(
            activity: activityService.getActivity(),
            onDone: { self.cordinator.route(to: \.rateUsScreen) },
            onClose: { self.cordinator.popLast() }
        )
        return AnyView(ActivityView(vm: vm))
    }
    
    func makeRateScreen() -> AnyView {
        let activity = self.activityService.getActivity()
        let onDone: (Feedback) -> Void = {
            self.activityService.rateActivity(activity: activity, feedback: $0)
            self.cordinator.route(to: \.mainScreen)
        }
        let vm = RateViewModel(category: self.activityService.getActivity().category , questions: self.activityService.getQuestions(activity: activity), onDone: onDone)
        let rateView = RateView(vm: vm)
        return AnyView(rateView)
    }
}

//
//  ActivityModule.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import API
// swiftlint:disable type_name

protocol Module {
    @ViewBuilder var rootView: AnyView { get }
}

final class ActivityModule: Module {
    @ViewBuilder var rootView: AnyView {
        cordinator.view()
    }
    let cordinator: MainCordinator
    private let activityService: ActivityServiceProtocol
    private let personService: PersonServiceProtocol
    
    init() {
        let apiLayer: APIServiceProtocol = APIService()
        self.activityService = FakeActivityService(api: apiLayer)
        self.personService = PersonService(api: apiLayer)
        self.cordinator = MainCordinator()
        self.cordinator.factory = self
    }
}

extension ActivityModule: MainScreenFactory {
    func makeMainScreen() -> AnyView {
        return AnyView(MainView(viewModel: MainViewModel(
            person: personService.getPerson(with: 0),
            activity: activityService.getActivity(for: 0),
            showCongratulationsBanner: activityService.shouldShowBanner,
            onCongratsClose: { self.activityService.shouldShowBanner = false },
            onDetailsScreen: {
                self.cordinator.route(to: \.detailsScreen)
            })))
    }
    
    func makeDeailedActivityScreen() -> AnyView {
        return AnyView(ActivityView(
            vm: ActivityViewModel(
                activity: activityService.getActivity(for: 0),
                onDone: { self.cordinator.route(to: \.rateUsScreen) },
                onClose: { self.cordinator.popLast() }
            )))
    }
    
    func makeRateScreen() -> AnyView {
        let activity: Activity = self.activityService.getActivity(for: 0)
        let onDone: (Feedback) -> Void = {
            self.activityService.rateActivity(activity: activity, for: 0, feedback: $0)
            self.cordinator.route(to: \.mainScreen)
        }
        let vm = RateViewModel(category: self.activityService.getActivity(for: 0).category , questions: self.activityService.getQuestions(activity: activity), onDone: onDone)
        let rateView = RateView(vm: vm)
        return AnyView(rateView)
    }
}

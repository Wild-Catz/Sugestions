//
//  ActivityModule.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI

// swiftlint:disable type_name

protocol Module {
    associatedtype V: View

    @ViewBuilder var rootView: V { get }
}

final class ActivityModule: Module {
    private typealias R = Router<RoutingDestination>

    @ViewBuilder var rootView: some View {
        self.presentingView
    }
    private var presentingView: PresentingView<R, ActivityModule>!
    private let router = R()
    private let activityService = FakeActivityService()
    private let personService = FakePersonService(ratingService: RatingService())
    
    init() {
        router.push(.mainScreen)
        self.presentingView = PresentingView(router: router, factory: self, root: .mainScreen)
    }
}

extension ActivityModule {
    enum RoutingDestination: RoutingDestinationProtocol {
        case mainScreen
        case detailsScreen
        case rateUsScreen
    }
}

extension ActivityModule.RoutingDestination: Identifiable {
    var id: String { "\(self)" }
}

extension ActivityModule: ScreenFactory {
    @ViewBuilder func view(for destination: RoutingDestination) -> some View {
        switch destination {
        case .detailsScreen:
            makeDeailedActivityScreen()
        case .mainScreen:
            makeMainScreen()
        case .rateUsScreen:
            makeRateScreen()
        }
    }

    @ViewBuilder func makeMainScreen() -> some View {
        MainView(viewModel: MainViewModel(
            person: personService.getPerson(),
            activity: activityService.getActivity(),
            showCongratulationsBanner: activityService.shouldShowBanner,
            onCongratsClose: { self.activityService.shouldShowBanner = false },
            onDetailsScreen: { self.router.push(.detailsScreen) })
                 )
    }

    @ViewBuilder func makeDeailedActivityScreen() -> some View {
        ActivityView(
            vm: ActivityViewModel(
                activity: activityService.getActivity(),
                onDone: { self.router.push(.rateUsScreen) },
                onClose: { self.router.pop() }
            ))
    }
    
    @ViewBuilder func makeRateScreen() -> some View {
        let activity: Activity = self.activityService.getActivity()
        RateView(vm: RateViewModel(category: activity.category, questions: self.activityService.getQuestions(activity: activity)) {
            self.activityService.rateActivity(activity: activity, feedback: $0)
            self.router.pop()
            self.router.pop()
        })
    }
    
    typealias RD = RoutingDestination
}

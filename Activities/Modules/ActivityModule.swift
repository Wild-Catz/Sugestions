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
    init() {
        self.presentingView = PresentingView(router: router, factory: self, root: .mainScreen)
    }
}

extension ActivityModule {
    enum RoutingDestination: RoutingDestinationProtocol {
        case mainScreen
        case detailsScreen
        case rateUsScreen
        case congratulationsScreen
    }
}

extension ActivityModule.RoutingDestination: Identifiable {
    var id: String { "\(self)" }
}

extension ActivityModule: ScreenFactory {
    @ViewBuilder func view(for destination: RoutingDestination) -> some View {
        switch destination {
        case .congratulationsScreen:
            EmptyView()
        case .detailsScreen:
            makeDetailsView()
        case .mainScreen:
            EmptyView()
        case .rateUsScreen:
            EmptyView()
        }
    }
    
    @ViewBuilder func makeDetailsView() -> some View {
        DetailsView(activityService : ActivityService())
    }
    typealias RD = RoutingDestination
}
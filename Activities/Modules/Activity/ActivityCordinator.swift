//
//  Router.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Stinsen

// swiftlint:disable type_name

protocol MainScreenFactory: AnyObject {
    func makeMainScreen() -> AnyView
    func makeDeailedActivityScreen() -> AnyView
    func makeRateScreen() -> AnyView
}

final class MainCordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCordinator.mainScreen)
    weak var factory: MainScreenFactory? 

    @Route(.push) var mainScreen = makeMainScreen
    @Route(.fullScreen) var detailsScreen = makeDeailedActivityScreen
    @Route(.fullScreen) var rateUsScreen = makeRateScreen
}

extension MainCordinator {
    @ViewBuilder func makeMainScreen() -> some View {
        if let factory = self.factory {
            factory.makeMainScreen()
                .preferredColorScheme(.light)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder func makeDeailedActivityScreen() -> some View {
        if let factory = self.factory {
            factory.makeDeailedActivityScreen()
                .preferredColorScheme(.light)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func makeRateScreen() -> some View {
        if let factory = self.factory {
            factory.makeRateScreen()
                .preferredColorScheme(.light)
        } else {
            EmptyView()
        }
    }
}

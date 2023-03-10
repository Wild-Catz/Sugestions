//
//  Router.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Stinsen

// swiftlint:disable type_name

// MARK: - MainScreenFactory Protocol

protocol MainScreenFactory: AnyObject {
    func makeMainScreen() -> AnyView
    func makeDeailedActivityScreen() -> AnyView
    func makeRateScreen() -> AnyView
}

// MARK: - MainCoordinator

final class MainCordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCordinator.mainScreen)
    weak var factory: MainScreenFactory? 

    @Route(.push) var mainScreen = makeMainScreen
    @Route(.fullScreen) var detailsScreen = makeDeailedActivityScreen
    @Route(.fullScreen) var rateUsScreen = makeRateScreen
}

// MARK: - MainCoordinator Routes

extension MainCordinator {
    @ViewBuilder func makeMainScreen() -> some View {
        if let factory = self.factory {
            factory.makeMainScreen()
        } else {
            EmptyView()
        }
    }

    @ViewBuilder func makeDeailedActivityScreen() -> some View {
        if let factory = self.factory {
            factory.makeDeailedActivityScreen()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func makeRateScreen() -> some View {
        if let factory = self.factory {
            factory.makeRateScreen()
        } else {
            EmptyView()
        }
    }
}

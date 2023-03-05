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
    func makeRateScreen()  -> AnyView
}

final class MainCordinator<F: MainScreenFactory> : NavigationCoordinatable {
    let stack = NavigationStack(initial: \MainCordinator.mainScreen)
    weak var factory: F? 

    @Root var mainScreen = makeMainScreen
    @Route(.push) var detailsScreen = makeDeailedActivityScreen
    @Route(.push) var rateUsScreen = makeRateScreen
}

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

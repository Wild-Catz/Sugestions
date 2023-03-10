//
//  Router.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Stinsen

// swiftlint:disable type_name

// MARK: - OnboardingScreenFactory Protocol

protocol OnboardingScreenFactory: AnyObject {
    func makeStartScreen() -> AnyView
    func makeUserDataScreen() -> AnyView
    func makeQuestionScreen() -> AnyView
    func makeCategoriesScreen() -> AnyView
    func makeEndScreen() -> AnyView
}

// MARK: - OnboardingCordinator

final class OnboardingCordinator : NavigationCoordinatable {
    let stack = NavigationStack(initial: \OnboardingCordinator.startScreen)
    weak var factory: OnboardingScreenFactory?

    @Route(.push) var startScreen = makeStartScreen
    @Route(.push) var userDataScreen = makeuserDataScreen
    @Route(.push) var questionScreen = makeQuestionScreen
    @Route(.push) var categoriesScreen = makeCategoriesScreen
    @Route(.push) var endScreen = makeEndScreen
}

// MARK: - OnboardingCordinator Routes

extension OnboardingCordinator {
    @ViewBuilder func makeStartScreen() -> some View {
        if let factory = self.factory {
            factory.makeStartScreen()
        } else {
            EmptyView()
        }
    }

    @ViewBuilder func makeuserDataScreen() -> some View {
        if let factory = self.factory {
            factory.makeUserDataScreen()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func makeQuestionScreen() -> some View {
        if let factory = self.factory {
            factory.makeQuestionScreen()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func makeCategoriesScreen() -> some View {
        if let factory = self.factory {
            factory.makeCategoriesScreen()
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func makeEndScreen() -> some View {
        if let factory = self.factory {
            factory.makeEndScreen()
        } else {
            EmptyView()
        }
    }
}

////
////  Router.swift
////  Activities
////
////  Created by Roman Gorbenko on 17/02/23.
////
//
//import SwiftUI
//import Stinsen
//
//// swiftlint:disable type_name
//
//final class AssemblyCoordinator : NavigationCoordinatable {
//    var stack: Stinsen.NavigationStack<AssemblyCoordinator>
//    
//    private let mainScreenFactory: MainScreenFactory
//    private let onboardingScreenFactory: OnboardingScreenFactory
//
//    @Root var main = makeMain
//    @Root var onboarding = makeOnboarding
//    
//    init(mainScreenFactory: MainScreenFactory, onboardingScreenFactory: OnboardingScreenFactory, firstLaunch: Bool) {
//        self.mainScreenFactory = mainScreenFactory
//        self.onboardingScreenFactory = onboardingScreenFactory
//        if firstLaunch {
//            stack = NavigationStack(initial: \.main)
//        } else {
//            stack = NavigationStack(initial: \.onboarding)
//        }
//        
//    }
//}
//
//extension AssemblyCoordinator {
//    func makeMain() -> MainCordinator {
//        let cord = MainCordinator()
//        cord.factory = mainScreenFactory
//        return cord
//    }
//    
//    func makeOnboarding() -> OnboardingCordinator {
//        let cord = OnboardingCordinator()
//        cord.factory = onboardingScreenFactory
//        return cord
//    }
//}

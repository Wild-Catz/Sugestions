//
//  Router.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Combine

// swiftlint:disable type_name

protocol RoutingDestinationProtocol: Identifiable, Hashable { }

protocol RouterProtocol: ObservableObject {
    associatedtype RD = RoutingDestinationProtocol
    var navigationPath: NavigationPath { get set }
    var presentedView: RD? { get set }

    func push(_ destination: RD)
    func pop()
    func present(_ destination: RD)
    func dismiss()
    func clear()
}

protocol ScreenFactory: AnyObject {
    associatedtype RD: RoutingDestinationProtocol
    associatedtype Vi: View

    func view(for destination: RD) -> Vi
}

final class Router<RD: RoutingDestinationProtocol>: RouterProtocol {
    @Published var navigationPath = NavigationPath()
    @Published var presentedView: RD?
    var anyCancallable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func clear() {
        while !navigationPath.isEmpty {
            pop()
        }
    }

    func push(_ destination: RD) {
        navigationPath.append(destination)
    }

    func pop() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }

    func present(_ destination: RD) {
        presentedView = destination
    }

    func dismiss() {
        presentedView = nil
    }
}

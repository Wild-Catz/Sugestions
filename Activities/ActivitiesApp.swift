//
//  ActivitiesApp.swift
//  Activities
//
//  Created by Roman Gorbenko on 16/02/23.
//

import SwiftUI

@main
struct ActivitiesApp: App {
    let module = ActivityModule()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                module.rootView
            }
            .environment(\.colorScheme, .light)
        }
    }
}

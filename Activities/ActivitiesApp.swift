//
//  ActivitiesApp.swift
//  Activities
//
//  Created by Roman Gorbenko on 16/02/23.
//

import SwiftUI

@main
struct ActivitiesApp: App {
    let module = OnboardingModule()

    var body: some Scene {
        WindowGroup {
            module.rootView
        }
    }
}

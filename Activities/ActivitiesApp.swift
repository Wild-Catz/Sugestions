//
//  ActivitiesApp.swift
//  Activities
//
//  Created by Roman Gorbenko on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assembly = ModuleAssembly()
    
    var body: some View {
        if let module = assembly.currentModule {
            module.rootView
                .environment(\.colorScheme, .light)
        }
    }
}

@main
struct ActivitiesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environment(\.colorScheme, .light)
        }
    }
}

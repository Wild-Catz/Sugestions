//
//  ModuleAssembley.swift
//  Activities
//
//  Created by Roman Gorbenko on 07/03/23.
//

import Foundation
import API

final class ModuleAssembly: ObservableObject {
    @Published var currentModule: (any Module)?
    let ud = UserDefaultsManager()
    
    init() {
        self.onboardingModule = OnboardingModule(activityService: makeActivityService(), personService: makePersonService()) { [weak self] in
            if let activityModule = self?.activityModule {
                self?.currentModule = activityModule
                self?.ud.save(false, forKey: "firstActivity")

            }
        }

        self.activityModule = ActivityModule(activityService: makeActivityService(), personService: makePersonService())
        
        self.currentModule =  isFirstLaunch() ? onboardingModule : activityModule
    }
    
    private func isFirstLaunch() -> Bool {
        let firstLaunch = self.ud.load(Bool.self, forKey: "firstActivity")
        return firstLaunch ?? true
    }
    
    // MARK: - Modules

    private var onboardingModule: (any Module)!
    private var activityModule: (any Module)!
    
}

extension ModuleAssembly {
    // MARK: - Dependencies

    enum Dependencies {
        static let api = APIService()
        static let activityService = FakeActivityService(api: Self.api)
        static let personService = PersonService(api: Self.api)
    }
    
    func makeActivityService() -> ActivityServiceProtocol {
        Dependencies.activityService
    }
    
    func makePersonService() -> PersonServiceProtocol {
        Dependencies.personService
    }
}

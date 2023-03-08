//
//  ModuleAssembley.swift
//  Activities
//
//  Created by Roman Gorbenko on 07/03/23.
//

import Foundation
import API

final class ModuleAssembly: ObservableObject {
    private var onboardingModule: (any Module)!
    private var activityModule: (any Module)!
    
    @Published var currentModule: (any Module)?
    
    private let personService: PersonServiceProtocol = PersonService(api: APIService())
    private let activityService: ActivityServiceProtocol = FakeActivityService(api: APIService())
    
    init() {
        self.onboardingModule = OnboardingModule(activityService: self.activityService, personService: self.personService) { [weak self] in
            if let activityModule = self?.activityModule {
                self?.currentModule = activityModule
            }
        }
        self.activityModule = ActivityModule()
        self.currentModule = onboardingModule
    }
    
    func makeActivityModule() -> ActivityModule {
        ActivityModule()
    }
    
    func makeOnboardingModule() -> OnboardingModule {
        OnboardingModule(activityService: self.activityService, personService: self.personService) { [weak self] in
            if let activityModule = self?.activityModule {
                self?.currentModule = activityModule
            }
        }
    }
}

//
//  PreviewProvider + Constants.swift
//  Activities
//
//  Created by Roman Gorbenko on 05/03/23.
//

import SwiftUI
import API

extension PreviewProvider {
    static var apiService: APIServiceProtocol { APIService() }
    static var personService: PersonServiceProtocol { PersonService(api: apiService) }
    static var activityService: ActivityServiceProtocol { FakeActivityService(api: apiService) }
}

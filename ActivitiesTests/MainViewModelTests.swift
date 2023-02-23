//
//  MainViewModelTests.swift
//  ActivitiesTests
//
//  Created by Roman Gorbenko on 21/02/23.
//

import XCTest
@testable import Activities

class MainViewModelTests: XCTestCase {
    func testGetActivity() {
        let mockActivityService = MockActivityService()
        let viewModel = MainViewModel(activityService: mockActivityService, onDetailsScreen: {})
        viewModel.getActivity()
        XCTAssertNotNil(viewModel.activity)
    }

    func testOnButtonTap() {
        var didNavigateToDetailsScreen = false
        let viewModel = MainViewModel(activityService: MockActivityService(), onDetailsScreen: {
            didNavigateToDetailsScreen = true
        })
        viewModel.onButtonTap()
        XCTAssertTrue(didNavigateToDetailsScreen)
    }
}

class MockActivityService: ActivityServiceProtocol {
    func getActivity() -> Activity {
        return Activity(id: .min, name: "First", description: "Some descrioption", rate: .init())
    }
}

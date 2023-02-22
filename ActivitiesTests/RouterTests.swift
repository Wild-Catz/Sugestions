//
//  RouterTests.swift
//  ActivitiesTests
//
//  Created by Roman Gorbenko on 20/02/23.
//

import XCTest
@testable import Activities

class RouterTests: XCTestCase {

    func testPush() {
        let router = Router<MyDestination>()
        let destination1 = MyDestination()
        let destination2 = MyDestination()
        router.push(destination1)
        router.push(destination2)
        XCTAssertEqual(router.navigationPath.count, 2)
        XCTAssert(router.presentedView == nil)
        router.pop()
        XCTAssertEqual(router.navigationPath.count, 1)
        XCTAssert(router.presentedView == nil)
        router.pop()
        XCTAssertEqual(router.navigationPath.count, 0)
        XCTAssert(router.presentedView == nil)
        XCTAssert(router.navigationPath.isEmpty)
    }

    func testPop() {
        let router = Router<MyDestination>()
        let destination1 = MyDestination()
        let destination2 = MyDestination()
        router.push(destination1)
        router.push(destination2)
        XCTAssertEqual(router.navigationPath.count, 2)
        router.pop()
        XCTAssertEqual(router.navigationPath.count, 1)
        router.pop()
        XCTAssertNil(router.presentedView)
        XCTAssertEqual(router.navigationPath.count, 0)
    }

    func testPresent() {
        let router = Router<MyDestination>()
        let destination = MyDestination()
        router.present(destination)
        XCTAssertEqual(router.presentedView, destination)
    }

    func testDismiss() {
        let router = Router<MyDestination>()
        let destination = MyDestination()
        router.present(destination)
        router.dismiss()
        XCTAssertNil(router.presentedView)
    }
}

// A dummy destination class for testing purposes
struct MyDestination: RoutingDestinationProtocol {

}

extension MyDestination: Identifiable {
    var id: String { "\(self)" }
}

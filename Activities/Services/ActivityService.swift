//
//  ActivityService.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import Foundation

protocol ActivityServiceProtocol {
    func getActivity() -> Activity
}

final class FakeActivityService {

}

extension FakeActivityService: ActivityServiceProtocol {
    func getActivity() -> Activity {
        Activity(id: .random(in: 0...32), name: "Some", description: "UUUUUUUU", rate: Rating())
    }
}

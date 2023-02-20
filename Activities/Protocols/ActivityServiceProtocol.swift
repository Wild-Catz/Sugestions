//
//  ActivityServiceProtocol.swift
//  Activities
//
//  Created by Valentina Russo on 17/02/23.
//

import Foundation

protocol ActivityServiceProtocol {
    var title: String { get }
    var description: String { get }
}

class ActivityService : ObservableObject {
    @Published var activityList: [Activity] = [Activity(domain: ["Speech", "Social Skills"], title: "Name my family", description: "An activity to improve speech skills..etc", instruction: "Use picture to ask the children the name of the person...etc", rating: 5), Activity(domain: ["Speech", "Social Skills"], title: "2 Name my family", description: "2 An activity to improve speech skills..etc", instruction: "2 Use picture to ask the children the name of the person...etc", rating: 7)]
    
    func getActivity() -> Activity! {
        activityList.randomElement() //need to replace random func with our algorithm
    }
    func rateActivity(){
        
    }

}

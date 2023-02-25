//
//  ActivityView.swift
//  Activities
//
//  Created by Roman Gorbenko on 22/02/23.
//

// swiftlint::disable line_length

import SwiftUI

struct DetailedActivity {
    let image: UIImage?
    let name: String
    let description: String

    init(activity: Activity) {
        self.image = nil
        self.name = activity.name
        self.description = activity.description
    }
}

protocol ActivityViewModelProtocol: ObservableObject {
    var activity: DetailedActivity { get }
}

final class ActivityViewModel: ActivityViewModelProtocol {
    private let activityService: ActivityServiceProtocol
    @Published var activity: DetailedActivity

    init(activityService: ActivityServiceProtocol) {
        self.activityService = activityService
        self.activity = .init(activity: activityService.getActivity())
    }

}

// swiftlint::disable line_length

struct ActivityView<VM: ActivityViewModelProtocol>: View {
    let vm: VM

    var body: some View {
        ActivityBigView(
            activityName: "Receptive language with images",
            primaryColor: .purple,
            titleColor: .purple.opacity(0.4),
            whatYouNeedLabel: "You need different objects in shapes, colors and sizes",
            description: """
                        Take the objects you choose and place them on a table. Sitting in front of the child, ask him to pass you an object by spelling out the name carefully.
                        
                        Don’t worry if the child does not respond or is struggling, you can help him by pointing to the object in question or by placing his hands directly on it, aiming more and mor

                        After each successful exercise give him positive reinforcement, compliment him and/or high-five him (don't give him physical/sweet rewards just yet).

                        Finally, before repeating the exercise, repeat the name of the object in question to strengthen the association.

                        Remember to always speak very clearly.

                        Repeat this exercise several times but remember to change the order of the objects on the table.

                        At the end of the session you can reward the child with sweets or a more substantial reward.
                        """, tipsAndTricls: [
                            "Avoid objects with a similar pronunciation in the same session",
                            "The table/place where you carry out your business must be free from other distractions and possibly noise",
                            "At the beginning is normal that the child is confused. Start giving him physical prompts, leading his hand to the right object, then try reducing the support step by step"
                        ])
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(vm: ActivityViewModel(activityService: FakeActivityService(personService: FakePersonService(), apiService: APIService(ratingService: RatingService()))))
    }
}

//
//  ActivityView.swift
//  Activities
//
//  Created by Roman Gorbenko on 22/02/23.
//

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

struct ActivityView<VM: ActivityViewModelProtocol>: View {
    let vm: VM

    var body: some View {
        VStack {
            HStack {
                Text(vm.activity.name)
                    .font(.largeTitle)
                Spacer()
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(vm: ActivityViewModel(activityService: FakeActivityService(personService: FakePersonService(), apiService: APIService(ratingService: RatingService()))))
    }
}

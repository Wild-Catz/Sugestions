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
    var tips: [Tip]
    var need: String

    init(activity: Activity) {
        self.image = nil
        self.name = activity.name
        self.description = activity.description
        self.tips = activity.tips
        self.need = activity.need
    }
}

protocol ActivityViewModelProtocol: ObservableObject {
    var activity: DetailedActivity { get }
    func onButtonTapped()
    func onCloseButtonTapped()
}

final class ActivityViewModel: ActivityViewModelProtocol {
    @Published var activity: DetailedActivity
    
    private let activityService: ActivityServiceProtocol
    private let onDone: () -> Void
    private let onClose: () -> Void

    init(activityService: ActivityServiceProtocol, onDone: @escaping () -> Void, onClose: @escaping () -> Void) {
        self.activityService = activityService
        self.activity = .init(activity: activityService.getActivity())
        self.onDone = onDone
        self.onClose = onClose
    }
    
    func onButtonTapped() {
        onDone()
    }
    
    func onCloseButtonTapped() {
        onClose()
    }
}

// swiftlint::disable line_length

struct ActivityView<VM: ActivityViewModelProtocol>: View {
    let vm: VM

    var body: some View {
        ZStack {
            ActivityBigView(
                activityName: vm.activity.name,
                primaryColor: .purple,
                titleColor: .purple.opacity(0.4),
                whatYouNeedLabel: vm.activity.need,
                description: vm.activity.description,
                tipsAndTricls: vm.activity.tips
            )
            VStack {
                Spacer()
                Button(action: vm.onButtonTapped) {
                    Color.purple
                        .overlay {
                            Text("Done")
                                .foregroundColor(.primary)
                                .font(.title3)
                                .bold()
                        }
                }
                .buttonStyle(.plain)
                .frame(height: 60)
                .cornerRadius(13)
                .padding(.horizontal, 40)
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: vm.onCloseButtonTapped) {
                        Text("Close")
                            .foregroundColor(.primary)
                            .font(.title2)
                    }
                }
                Spacer()
            }
        }
        .toolbar(.hidden)

    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(vm: ActivityViewModel(activityService: FakeActivityService(personService: FakePersonService(), apiService: APIService(ratingService: RatingService())), onDone: {}, onClose: {}))
    }
}

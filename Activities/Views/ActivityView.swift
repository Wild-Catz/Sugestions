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

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

struct ActivityView<VM: ActivityViewModelProtocol>: View {
    let vm: VM
    @State private var scrollPosition: CGPoint = .zero
    
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
            .coordinateSpace(name: "Scroll")
            .background(GeometryReader { geometry in
                Color.clear
                    .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
            })
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.scrollPosition = value
            }
            .background(GeometryReader { proxy in
                Color.clear.onAppear { print("-----total \(proxy.size.height)")
                    print("-----also total \(proxy.frame(in: .named("Scroll")).size.height)")
                    print("-----aaalso total \(proxy.frame(in: .named("Scroll")).origin.y)")
                }
            })

            VStack {
                Text("Scroll offset: \(scrollPosition.y)")
                Spacer()
                WCButton(action: vm.onButtonTapped, text: "Done")
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: vm.onCloseButtonTapped) {
                        Image(systemName: "x.circle.fill")
                           .foregroundColor(.primary)
                            .font(.system(size: 30))
                    }
                    .padding(.horizontal)
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

//
//  MainView.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI

private enum Const {
    static var bottomPadding: CGFloat = 33
    static var profileSize: CGFloat = 50
}

protocol MainViewModelProtocol: ObservableObject {
    func getActivity()
    func onButtonTap()
}

class MainViewModel: MainViewModelProtocol {
    var activityService: ActivityServiceProtocol
    @Published var activity: Activity?
    var onDetailsScreen: () -> Void

    init(activityService: ActivityServiceProtocol, onDetailsScreen: @escaping () -> Void) {
        self.onDetailsScreen = onDetailsScreen
        self.activityService = activityService
    }

    func onButtonTap() {
        onDetailsScreen()
    }

    func getActivity() {
        self.activity = activityService.getActivity()
    }
}

struct MainView<VM: MainViewModelProtocol>: View {
    let viewModel: VM

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Circle()
                    .fill(Color.red)
                    .frame(width: Const.profileSize, height: Const.profileSize)
            }
            Spacer()
            shape
            Spacer()
            Text(LocalizedStringKey("dayly_activity_label"))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer(minLength: 70)
            startButton
        }
        .toolbar(.hidden)
    }

    var startButton: some View {
        Button(action: viewModel.onButtonTap) {
            Text("start_button_label")
                .foregroundColor(.black)
            }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 30)
        .padding(.bottom, Const.bottomPadding)
    }

    var shape: some View {
        Image("shape")
            .resizable()
            .aspectRatio(0.71, contentMode: .fit)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(activityService: FakeActivityService(), onDetailsScreen: { }))
    }
}

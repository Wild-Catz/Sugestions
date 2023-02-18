//
//  MainView.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI

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
        Text("Main Screen")
        Button("On description screen", action: viewModel.onButtonTap)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(activityService: FakeActivityService(), onDetailsScreen: { }))
    }
}

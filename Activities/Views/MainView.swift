//
//  MainView.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Combine

private enum Const {
    static var bottomPadding: CGFloat = 33
    static var profileSize: CGFloat = 50
}

protocol MainViewModelProtocol: ObservableObject {
    var showCongratulationsBanner: Bool { get set }
    var person: Person { get }
    func onButtonTap()
    func closeShowBannerTap()
}

class MainViewModel: MainViewModelProtocol {
    var onDetailsScreen: () -> Void
    var onCongratsClose: () -> Void
    
    @Published var person: Person
    @Published var activity: Activity
    @Published var showCongratulationsBanner: Bool

    init(person: Person,
         activity: Activity,
         showCongratulationsBanner: Bool,
         onCongratsClose: @escaping () -> Void,
         onDetailsScreen: @escaping () -> Void) {
        self.person = person
        self.activity = activity
        self.showCongratulationsBanner = showCongratulationsBanner
        self.onDetailsScreen = onDetailsScreen
        self.onCongratsClose = onCongratsClose
    }

    func onButtonTap() {
        onDetailsScreen()
    }
    
    func closeShowBannerTap() {
        self.showCongratulationsBanner = false
        onCongratsClose()
    }
}

struct MainView<VM: MainViewModelProtocol>: View {
    @ObservedObject var viewModel: VM

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Welcome back,")
                        .font(.largeTitle)
                    Text(viewModel.person.name + "!")
                        .font(.largeTitle)
                        .bold()
                }
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 48, height: 48)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            Button(action: viewModel.onButtonTap) {
                MainButtonView()
                    .frame(height: 400)
                    .padding(.horizontal, 10)
            }
            .buttonStyle(.plain)
            .foregroundColor(.primary)
            Spacer()
        }
        .background(Color("MainBackgroundScreen"))
        .toolbar(.hidden)
        .blur(radius: viewModel.showCongratulationsBanner ? 30 : 0)
        .overlay {
            if viewModel.showCongratulationsBanner {
                CongratulationScreen(image: Image(systemName: "heart.fill"), imageSize: 300, action: {
                    self.viewModel.closeShowBannerTap()
                })
            }
        }
    }

    var shape: some View {
        Image("shape")
            .resizable()
            .aspectRatio(0.71, contentMode: .fit)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: FakePersonService().getPerson(),
                                          activity: FakeActivityService(
                                            personService: FakePersonService(),
                                            apiService: APIService(
                                                ratingService: RatingService())).getActivity(),
                                          showCongratulationsBanner: false,
                                          onCongratsClose: { },
                                          onDetailsScreen: { }))
    }
}

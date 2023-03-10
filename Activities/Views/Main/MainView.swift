//
//  MainView.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI
import Combine
import API

private enum Const {
    static var bottomPadding: CGFloat = 33
    static var profileSize: CGFloat = 50
    static var buttonHeight: CGFloat = 400
    static var buttonHPadding: CGFloat = 10
    static var movementToStop: CGFloat = 80
    static var congratulationImageWidth: CGFloat = 200
}

protocol MainViewModelProtocol: ObservableObject {
    var showCongratulationsBanner: Bool { get set }
    var person: Person { get }
    var activity: Activity { get }
    
    func onButtonTap()
    func closeShowBannerTap()
}

final class MainViewModel: MainViewModelProtocol {
    var onDetailsScreen: () -> Void
    var onCongratsClose: () -> Void
    
    var person: Person
    var activity: Activity
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
    @State private var offset = CGSize.zero
    @State private var degree: CGFloat = 0
    
    var body: some View {
        VStack {
            welcomBackLabel
                .padding(.top, 40)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            MainButtonView(model: .init(activity: viewModel.activity))
                .disabled(self.viewModel.showCongratulationsBanner)
                .frame(height: Const.buttonHeight)
                .padding(.horizontal, Const.buttonHPadding)
                .onTapGesture {
                    viewModel.onButtonTap()
                }
            Spacer()
        }
        .background(Color("MainBackgroundScreen"))
        .toolbar(.hidden)
        .blur(radius: viewModel.showCongratulationsBanner ? 30 : 0)
        .overlay {
            if viewModel.showCongratulationsBanner {
                congratsView
            }
        }
    }
    
    var congratsView: some View {
        CongratulationScreen(image: Image("congrats"), imageWidth: Const.congratulationImageWidth, aspectRatio: 1.72, color: Color(viewModel.activity.category.rawValue)) {
            self.viewModel.closeShowBannerTap()
        }
        .offset(x: offset.width/2, y: offset.height/2)
        .rotation3DEffect(.degrees(-offset.height / 50.0), axis: (x: 1, y: 1, z: 0))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > Const.movementToStop || abs(offset.height) > Const.movementToStop {
                        viewModel.closeShowBannerTap()
                    } else {
                        withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1)) {
                            offset = .zero
                        }
                    }
                }
        )
    }
    
    var welcomBackLabel: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Welcome back,")
                    .font(.largeTitle)
                Text(viewModel.person.name + "!")
                    .font(.largeTitle)
                    .bold()
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(person: self.personService.getPerson(), activity: self.activityService.getActivity(),
                                          showCongratulationsBanner: false,
                                          onCongratsClose: { },
                                          onDetailsScreen: { }))
    }
}

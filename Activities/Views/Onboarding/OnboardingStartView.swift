//
//  OnboardingStartView.swift
//  Activities
//
//  Created by Valentina Russo on 01/03/23.
//

import SwiftUI

protocol OnboardingViewModelProtocol: ObservableObject {
    func onButtonTapped()
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    let onUserDataView: () -> Void
    
    init(onUserDataView: @escaping () -> Void) {
        self.onUserDataView = onUserDataView
    }
    
    func onButtonTapped() {
        onUserDataView()
    }
}

struct OnboardingStartView<VM: OnboardingViewModelProtocol>: View {
        let vm: VM
    
    var body: some View {
        VStack {
            Text("onboarding_welcome")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .padding(.top)
            Spacer()
//            GeometryReader { proxy in
//                Image("Onboarding")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: proxy.size.width * 0.7)
//            }
            Image("Onboarding")
                .resizable()
                .scaledToFit()
                .frame(width: 240)
            Spacer()
            Text("onboarding_welcome_text")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Let's do it!", color: .black, colorFor: .white)
        }
        .padding()
    }
}

struct OnboardingStartView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartView(vm: OnboardingViewModel(onUserDataView: { }))
    }
}

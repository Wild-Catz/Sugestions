//
//  Onboarding_question.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingQuestionViewModelProtocol: ObservableObject {
    func getRating()
    func onButtonTapped()
}

final class OnboardingQuestionViewModel: OnboardingQuestionViewModelProtocol {
    func getRating() {
    
    }
    
    let onCategoriesView: () -> Void
    
    init(onCategoriesView: @escaping () -> Void) {
        self.onCategoriesView = onCategoriesView
    }
    
    func onButtonTapped() {
        onCategoriesView()
    }
}

struct OnboardingQuestion<VM: OnboardingQuestionViewModelProtocol>: View {
    let vm: VM
    
    var body: some View {
        TabView {
            ForEach(1..<9) { index in
                VStack {
                    if index == 1 {
                        Spacer()
                    }
                    Text("How well does your child understands verbal instructions?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 80)
                    CirclesView(rate: .constant(3), borderSize: 5)
                        .frame(height: 41)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    if index == 1 {
                        Spacer()
                        WCButton(action: vm.onButtonTapped, text: "Submit")
                            .padding(.bottom, 50)
                    }
                }
                .padding(.horizontal)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingQuestion_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingQuestion(vm: OnboardingQuestionViewModel(onCategoriesView: { }))
    }
}

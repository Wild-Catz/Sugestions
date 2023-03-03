//
//  Onboarding_question.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingQuestionViewModelProtocol: ObservableObject {
    var questions: [String] { get }
    func getRating()
    func onButtonTapped()
}

final class OnboardingQuestionViewModel: OnboardingQuestionViewModelProtocol {
    func getRating() {
    
    }
    
    let onCategoriesView: () -> Void
    
    let questions: [String]
    
    init(questions: [String], onCategoriesView: @escaping () -> Void) {
        self.questions = questions
        self.onCategoriesView = onCategoriesView
    }
    
    func onButtonTapped() {
        onCategoriesView()
    }
}

struct OnboardingQuestion<VM: OnboardingQuestionViewModelProtocol>: View {
    let vm: VM
//    let questions = vm.getQuestions()
    
    var body: some View {
        TabView {
            ForEach(0..<8) { index in
                VStack {
                    if index == 7 {
                        Spacer()
                    }
                    Text(LocalizedStringKey(vm.questions[index]))
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 80)
                    CirclesView(rate: .constant(3), borderSize: 5)
                        .frame(height: 41)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.bottom, index != 7 ? 120 : 0)
                        if index == 7 {
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
        .toolbar(.hidden)
    }
}

struct OnboardingQuestion_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingQuestion(vm: OnboardingQuestionViewModel(questions: ["How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?", "How well does your child understand verbal instructions?"], onCategoriesView: { }))
    }
}

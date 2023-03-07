//
//  Onboarding_question.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingQuestionViewModelProtocol: ObservableObject {
    var questions: [Question] { get }
    func getRating()
    func onButtonTapped()
}

final class OnboardingQuestionViewModel: OnboardingQuestionViewModelProtocol {
    func getRating() {
    
    }
    
    let onCategoriesView: () -> Void
    
    let questions: [Question]
    
    init(questions: [Question], onCategoriesView: @escaping () -> Void) {
        self.questions = questions
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
            ForEach(0..<8) { index in
                VStack {
                    Spacer()
                    Text(LocalizedStringKey(vm.questions[index].text))
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    CirclesView(rate: .constant(3), borderSize: 5, color: Color(vm.questions[index].category.rawValue))
                        .frame(height: 41)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 80)
                        .padding(.horizontal)
                        .padding(.bottom, index != 7 ? 250 : 0)
                        if index == 7 {
                            WCButton(action: vm.onButtonTapped, text: "Submit", color: .black, colorFor: .white)
                                .padding(.bottom, 50)
                                .padding(.top, 122)
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
        OnboardingQuestion(vm: OnboardingQuestionViewModel(questions: [], onCategoriesView: { }))
    }
}

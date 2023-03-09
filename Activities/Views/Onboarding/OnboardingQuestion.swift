//
//  Onboarding_question.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingQuestionViewModelProtocol: ObservableObject {
    var questions: [RateQuestion] { get }
    func getRating()
    func done()
    func onMarkChange(on arrayIndex: Int , mark: Mark)
    
}

final class OnboardingQuestionViewModel: OnboardingQuestionViewModelProtocol {
    func getRating() {
        
    }
    
    let onCategoriesView: (Feedback) -> Void
    
    var questions: [RateQuestion]
    
    init(questions: [Question], onCategoriesView: @escaping (Feedback) -> Void) {
        self.questions = questions.map {
            var q = RateQuestion(question: $0)
            q.ready = .ready(.normal)
            return q
        }
        self.onCategoriesView = onCategoriesView
    }
    
    func done() {
        let feedback = questions.reduce(Dictionary<QuestionID,Mark>()) { partialResult, question in
            var result = partialResult
            if case let .ready(mark) = question.ready {
                result[question.id] = mark
            } else {
                fatalError()
            }
            return result
        }
        onCategoriesView(feedback)
    }
    
    func onMarkChange(on arrayIndex: Int, mark: Mark) {
        self.questions[arrayIndex].ready = .ready(mark)
    }
}

struct OnboardingQuestion<VM: OnboardingQuestionViewModelProtocol>: View {
    let vm: VM
    
    var body: some View {
        TabView {
            ForEach(0..<8) { index in
                VStack {
                    Spacer()
                    BigQuestionView(question: vm.questions[index], color: Color(vm.questions[index].category.rawValue), mark: 1) {
                            vm.onMarkChange(on: index, mark: Mark.fiveSystem(from: $0))
                        }
                        .padding(.bottom, index != 7 ? 250 : -142)
                    if index == 7 {
                        Spacer()
                        WCButton(action: vm.done, text: "Submit", color: .black, colorFor: .white)
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
        OnboardingQuestion(vm: OnboardingQuestionViewModel(questions: [], onCategoriesView: { _ in }))
    }
}

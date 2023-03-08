//
//  RateView.swift
//  Activities
//
//  Created by Roman Gorbenko on 26/02/23.
//

import SwiftUI

struct RateQuestion: Hashable {
    enum Ready: Hashable {
        case ready(Mark)
        case notReady
    }
    
    let id: QuestionID
    let text: String
    let category: Category
    var ready: Ready
    
    init(question: Question) {
        self.id = question.id
        self.text = question.text
        self.category = question.category
        self.ready = .notReady
    }
}

protocol RateViewModelProtocol: ObservableObject {
    var category: Category { get }
    var questions: [RateQuestion] { get }
    var isButtonEnabled: Bool { get }
    func done()
    func onMarkChange(on questionID: QuestionID, mark: Mark)
}

final class RateViewModel: RateViewModelProtocol {
    var questions: [RateQuestion]
    private let onDone: (Feedback) -> Void
    let category: Category
    @Published var isButtonEnabled: Bool = false
    
    init(category: Category, questions: [Question], onDone: @escaping (Feedback) -> Void) {
        self.onDone = onDone
        self.category = category
        self.questions = questions.map { RateQuestion(question: $0) }
    }
    
    func done() {
        let feedback = questions.reduce(Dictionary<QuestionID,Mark>()) { partialResult, question in
            var result = partialResult
            if case let .ready(mark) = question.ready {
                result[question.id] = mark
            } else {
                assertionFailure("Shouldnt be not ready")
            }
            return result
        }
        onDone(feedback)
    }
    
    func onMarkChange(on arrayIndex: Int , mark: Mark) {
        self.questions[arrayIndex].ready = .ready(mark)
        isButtonEnabled = questions.allSatisfy {
            if case .ready = $0.ready {
                return true
            } else {
                return false
            }
        }
    }
}

struct RateView<VM: RateViewModelProtocol>: View {
    @ObservedObject var vm: VM
    
    var body: some View {
        VStack {
            Text("Well Done!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50)
                .padding(.bottom, 26)
            Text("Rate it to create your path more specific")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            Spacer()
            ForEach(vm.questions.indices, id: \.self) { index in
                QuestionView(question: vm.questions[index], color: Color(vm.category.rawValue), mark: 0, onMarkChange: {
                    vm.onMarkChange(on: index, mark: Mark.fiveSystem(from: $0))
                })
            }
            Spacer()
            WCButton(action: { vm.done() } , text: "Done", color: Color(vm.category.rawValue), colorFor: .white)
                .disabled(!vm.isButtonEnabled)
        }
        .toolbar(.hidden)
    }
}

//
//  RateView.swift
//  Activities
//
//  Created by Roman Gorbenko on 26/02/23.
//

import SwiftUI

protocol RateViewModelProtocol: ObservableObject {
    var feedbackPublisher: Published<Feedback>.Publisher { get }
    var feedback: Feedback { get }
    func done()
}

final class RateViewModel: RateViewModelProtocol {
    var feedbackPublisher: Published<Feedback>.Publisher { self.$feedback }
            
    @Published var feedback: Feedback
    private let onDone: (Feedback) -> Void
    
    init(questions: [Question], onDone: @escaping (Feedback) -> Void) {
        self.feedback = [:]
        self.onDone = onDone
        questions.forEach { feedback[$0] = .normal }
    }
    
    func done() {
        onDone(feedback)
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
            Spacer()
            ForEach(vm.feedback.map { $0.key }, id: \.self) { question in
                VStack {
                    Text(question.text)
                        .font(.title2)
                    CirclesView(rate: .constant(3), borderSize: 5)
                        .frame(height: 41)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 23)
                }
                
            }
            Spacer()
            WCButton(action: { vm.done() } , text: "Done")
        }
        .toolbar(.hidden)
    }
}

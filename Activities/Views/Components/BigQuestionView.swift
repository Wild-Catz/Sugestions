//
//  BigQuestionView.swift
//  Activities
//
//  Created by Roman Gorbenko on 07/03/23.
//

import SwiftUI

struct BigQuestionView: View {
    let question: RateQuestion
    let color: Color
    @State var mark: Int
    let onAnswerChanged: (Int) -> Void
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey(question.text))
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 80)
            CirclesView(rate: $mark, borderSize: 5, color: color)
                .frame(height: 41)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            //                .padding(.bottom, index != 7 ? 250 : 0)
            //            if index == 7 {
            //                WCButton(action: vm.onButtonTapped, text: "Submit", color: .black, colorFor: .white)
            //                    .padding(.bottom, 50)
            //                    .padding(.top, 122)
            //            }
        }
        .padding(.horizontal)
    }
}

struct BigQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        BigQuestionView(question: .init(question: .init(id: 3, text: "", category: .expressive)), color: .accentColor, mark: 3, onAnswerChanged: {_ in })
    }
}

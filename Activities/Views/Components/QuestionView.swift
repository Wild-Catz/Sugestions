//
//  QuestionView.swift
//  Activities
//
//  Created by Roman Gorbenko on 05/03/23.
//

import SwiftUI
import Combine

struct QuestionView: View {
    let question: RateQuestion
    let color: Color
    @State var mark: Int = 0
    let onMarkChange: (Int) -> Void
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey(question.text))
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            CirclesView(rate: $mark, borderSize: 5, color: color)
                .frame(height: 41)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 23)
        }
        .onChange(of: mark, perform: onMarkChange)
    }
}

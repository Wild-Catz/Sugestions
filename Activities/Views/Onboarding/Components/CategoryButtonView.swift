//
//  CategoryButtonView.swift
//  Activities
//
//  Created by Roman Gorbenko on 08/03/23.
//

import SwiftUI

struct CategoryButtonView: View {
    let color: Color
    let text: String
    var selected: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(height: 120)
                    .foregroundColor(self.selected == false ? .gray.opacity(0.20) : color)
                Text(text)
                    .fontWeight(.medium)
                    .font(.title2)
            }
        }
        .buttonStyle(.plain)
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView(color: .accentColor , text: "", selected: false, action: {})
    }
}

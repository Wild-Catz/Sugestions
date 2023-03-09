//
//  WCButton.swift
//  Activities
//
//  Created by Roman Gorbenko on 27/02/23.
//

import SwiftUI

struct WCButton: View {
    let action: () -> Void
    let text: LocalizedStringKey
    let color: Color
    let colorFor: Color
    
    var body: some View {
        Button(action: action) {
            color
                .overlay {
                    Text(text)
                        .foregroundColor(colorFor)
                        .font(.title3)
                        .bold()
                }
        }
        .buttonStyle(.plain)
        .frame(height: 60)
        .cornerRadius(13)
        .padding(.horizontal, 40)
        .padding(.bottom, 10)
        .shadow(color: Color.black.opacity(0.25), radius: 4, y: 4)

    }
}

struct WCButton_Previews: PreviewProvider {
    static var previews: some View {
        WCButton(action: {}, text: "Some", color: .yellow, colorFor: .black )
    }
}

//
//  SquareSelector.swift
//  Activities
//
//  Created by Valentina Russo on 01/03/23.
//

import SwiftUI

struct SquareSelector: View {
    @Binding var selectorContent: String
    
    var body: some View {
        ZStack {
            Text("\(selectorContent)")
                .fontWeight(.medium)
                .font(.title2)
            RoundedRectangle(cornerRadius: 13)
                .frame(height: 107)
                .foregroundColor(.gray.opacity(0.20))
        }
    }
}

struct SquareSelector_Previews: PreviewProvider {
    static var previews: some View {
        SquareSelector(selectorContent: .constant("text"))
    }
}

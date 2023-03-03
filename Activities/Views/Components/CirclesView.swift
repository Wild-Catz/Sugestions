//
//  CirclesView.swift
//  Activities
//
//  Created by Roman Gorbenko on 27/02/23.
//

import SwiftUI

struct CirclesView: View {
    @Binding var rate: Int
    let borderSize: Int
    let color: Color
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Spacer()
                Circle()
                    .strokeBorder(.black, lineWidth: 4)
                    .background(Circle().fill(index <= rate ? self.color : Color.clear))
                    .onTapGesture {
                        self.rate = index
                    }
                Spacer()
            }
        }

    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(rate: .constant(3), borderSize: 5, color: .purple)
    }
}

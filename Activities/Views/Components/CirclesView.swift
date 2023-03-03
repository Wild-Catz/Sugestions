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
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Spacer()
                Button {
                    self.rate = index
                } label: {
                    if index <= rate {
                        Image(systemName: "circle.fill")
                            .font(.system(size:41))
                            .foregroundColor(Color.primary)
                    } else {
                        Image(systemName: "circle")
                            .font(.system(size:41))
                            .foregroundColor(Color.primary)
                    }
                }
//                Circle()
//                    .strokeBorder(.black, lineWidth: 2)
//                    .background(Circle().fill(index <= rate ? Color.orange : Color.clear))
//                    .onTapGesture {
//                        self.rate = index
//                    }
                Spacer()
            }
        }

    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(rate: .constant(3), borderSize: 5)
    }
}

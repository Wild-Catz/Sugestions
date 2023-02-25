//
//  MainButtonView.swift
//  Activities
//
//  Created by Roman Gorbenko on 24/02/23.
//

import SwiftUI

struct MainButtonView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ZStack {
                    Color.purple
                    VStack {
                        Text("THE ACTIVITY")
                        Text("OF THE DAY")
                    }
                    .font(.title.bold())
                }
                .frame(height: proxy.size.height * 2/3)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Receptive language with images")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(width: 0.7 * proxy.size.width)
                        .padding(.top, 17)
                    Text("New words, new connections!")
                        .font(.caption2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 26)
                }
                .frame(height: proxy.size.height * 1/3)
                .padding(.leading, 24)
                .background(.white)
            }
            .cornerRadius(34)
        }
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView()
    }
}

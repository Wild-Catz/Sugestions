//
//  CongratulationScreen.swift
//  Activities
//
//  Created by Roman Gorbenko on 28/02/23.
//

import SwiftUI

private enum Const {
    static let closeButtonSize: CGFloat = 30
}

struct CongratulationScreen: View {
    let image: Image
    let imageWidth: CGFloat
    let aspectRatio: CGFloat
    let color: Color
    let action: () -> Void
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .foregroundColor(.white)
                .frame(width: imageWidth, height: imageWidth * aspectRatio)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
                .opacity(0.95)
                .overlay {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: action) {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.white.opacity(0.78))
                                    .frame(width: Const.closeButtonSize, height: Const.closeButtonSize)
                                    .padding(.top, 17)
                                    .padding(.trailing, 20)
                            }
                        }
                        Spacer()
                    }
                }
                .cornerRadius(17)
                .padding(.vertical, 40)
                .padding(.horizontal, 20)
        }
    }
}

struct CongratulationScreen_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationScreen(image: Image(systemName: "heart.fill"), imageWidth: 300, aspectRatio: 1.5, color: .purple, action: {})
    }
}

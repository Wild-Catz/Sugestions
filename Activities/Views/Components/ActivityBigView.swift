//
//  ActivityBigView.swift
//  Activities
//
//  Created by Roman Gorbenko on 24/02/23.
//

import SwiftUI

// swiftlint:disable line_length

struct ActivityBigView: View {
    let activityName: String
    let primaryColor: Color
    let titleColor: Color
    let whatYouNeedLabel: String
    let description: String
    let tipsAndTricls: [String]
    @State private var offset = CGFloat.zero
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        primaryColor
                            .ignoresSafeArea()
                    }
                    .ignoresSafeArea()
                    .frame(height: proxy.size.height/2)
                    .overlay {
                        VStack(spacing: 0) {
                            VStack {
                                Text("daily_activity_lable_1")
                                Text("daily_activity_lable_2")
                            }
                            .font(.title2)
                            .bold()
                            .padding(.top, 25)
                            Image("illustration")
                                .resizable()
                                .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9 / 1.5)
                        }

                    }
                    ZStack(alignment: .leading) {
                        titleColor
                        Text(activityName)
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: proxy.size.width*0.7)
                            .padding(.leading, 20)
                            .padding(.vertical, 25)
                    }
                    VStack(alignment: .leading) {
                        Text(whatYouNeedLabel)
                            .font(.title2)
                            .padding(.bottom, 45)
                        Text("Activity description")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                        Text(description)
                            .font(.title2)
                            .padding(.bottom, 45)
                        Text("Tips and tricks")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)

                        ForEach(tipsAndTricls, id: \.self) { tip in
                            Text(tip)
                                .font(.title2)
                                .padding(.bottom, 20)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                    .padding(.bottom, 60)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ActivityBigView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityBigView(
            activityName: "Receptive language with images",
            primaryColor: .purple,
            titleColor: .purple.opacity(0.4),
            whatYouNeedLabel: "You need different objects in shapes, colors and sizes",
            description: """
                        Take the objects you choose and place them on a table. Sitting in front of the child, ask him to pass you an object by spelling out the name carefully.
                        
                        Don’t worry if the child does not respond or is struggling, you can help him by pointing to the object in question or by placing his hands directly on it, aiming more and more to reduce the use of these aids.

                        After each successful exercise give him positive reinforcement, compliment him and/or high-five him (don't give him physical/sweet rewards just yet).

                        Finally, before repeating the exercise, repeat the name of the object in question to strengthen the association.

                        Remember to always speak very clearly.

                        Repeat this exercise several times but remember to change the order of the objects on the table.

                        At the end of the session you can reward the child with sweets or a more substantial reward.
                        """, tipsAndTricls: [
                            "Avoid objects with a similar pronunciation in the same session",
                            "The table/place where you carry out your business must be free from other distractions and possibly noise",
                            "At the beginning is normal that the child is confused. Start giving him physical prompts, leading his hand to the right object, then try reducing the support step by step"
                        ])
    }
}

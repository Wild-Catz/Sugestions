//
//  MainButtonView.swift
//  Activities
//
//  Created by Roman Gorbenko on 24/02/23.
//

import SwiftUI
import API
struct MainButtonModel {
    let name: String
    let description: String
    let category: Category
    let done: Bool
    
    init(activity: Activity) {
        self.name = activity.name
        self.description = activity.description
        self.category = activity.category
        self.done = activity.isDone
    }
}

struct MainButtonView: View {
    let model: MainButtonModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ZStack {
                    Color(model.category.rawValue)
                    VStack {
                        Text("THE ACTIVITY")
                        Text("OF THE DAY")
                    }
                    .font(.title.bold())
                }
                .frame(height: proxy.size.height * 2/3)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(model.name)
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: 0.7 * proxy.size.width)
                            .padding(.top, 17)
                        Text(model.description)
                            .font(.title3)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 26)
                    }
                    if model.done {
                        Image("done_" + model.category.rawValue)
                            .padding(.trailing, 15)
                    }
                }
                .frame(height: proxy.size.height * 1/3)
                .padding(.horizontal, 24)
                .background(.white)
            }
            .cornerRadius(13)
        }
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(model: .init(activity: self.activityService.getActivity(for: 0)))
    }
}

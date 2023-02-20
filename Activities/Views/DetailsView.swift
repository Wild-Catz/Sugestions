//
//  DetailsView.swift
//  Activities
//
//  Created by Valentina Russo on 17/02/23.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var activityService : ActivityService
    var body: some View {
        var currentActivity = activityService.getActivity()
        VStack{
            Text(currentActivity!.title)
            Text(currentActivity!.description)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(activityService : ActivityService())
    }
}

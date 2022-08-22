//
//  DailyTasks.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 21/08/2022.
//

import SwiftUI

struct DailyTasks: View {
    var body: some View {

        VStack{
            Text("Daily Tasks")
            LandingView()
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct DailyTasks_Previews: PreviewProvider {
    static var previews: some View {
        DailyTasks()
    }
}

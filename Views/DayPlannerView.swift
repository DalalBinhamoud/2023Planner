//
//  DayPlannerView.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 19/08/2022.
//

import SwiftUI

struct DayPlannerView: View {
    @Binding var toggleDay: Bool

    var body: some View {  NavigationView {
        Button(action:{
            toggleDay.toggle()
        }){
            Text("hi")
        }

    }
    }
}

struct DayPlannerView_Previews: PreviewProvider {
    @State static var toggleDay = false

    static var previews: some View {
        DayPlannerView(toggleDay: $toggleDay)
    }
}

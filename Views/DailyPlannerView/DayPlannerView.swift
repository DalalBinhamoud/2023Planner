//
//  DayPlannerView.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 19/08/2022.
//

import SwiftUI

struct DayPlannerView: View {
    @Binding var toggleDay: Bool
    var currentDay: String = "1"

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<DayPlanner>

    @EnvironmentObject var dateHolder: DateHolder

   // @State var selectedDayData: DailyPlanDto



    //    let formatter = DateFormatter()
    //    formatter.dateFormat = "MM-dd"



    var body: some View {  NavigationView {
        VStack{
//            List {
//                 ForEach(days, id: \.self) { country in
//                     Section(country.date) {
//                         ForEach(country.has, id: \.self) { candy in
//                             Text(candy.taskName)
//                         }
//                     }
//                 }

            HStack{
                DailyTasks().background(.red).frame(maxWidth:.infinity)
                // Spacer()
                DailyExcercises().background(.green).frame(maxWidth:.infinity)
                //                Spacer()
                TodayFeelings().background(.blue)
            }.frame(maxWidth:.infinity)
            Spacer()
            HStack{

              //  Spacer()
                Button(action:{}){
                    VStack {
                        Text("Save")

                    }.frame(maxWidth:.infinity)

                }.background(.pink).frame(maxWidth:.infinity)

              //  Spacer()
                Button(action:{
                    toggleDay.toggle()
                }){
                    VStack {
                        Text("Cancel")

                    }.frame(maxWidth:.infinity)
                    // Text("hi \(getCoreDataKey(dateHolder: dateHolder.date, currentDay: currentDay))")
                }.background(.yellow).frame(maxWidth:.infinity)
               // Spacer()
            }.frame(maxWidth:.infinity)


        }.frame(maxWidth: .infinity).background(.brown).onAppear(
//            selectedDayData =  UserDefaults.standard.get(forKey: getCoreDataKey(dateHolder: dateHolder.date, currentDay: currentDay))
        )


    }
    }
}

// we will store month-day as a key in core data
func getCoreDataKey (dateHolder: Date, currentDay: String) -> String
{
    let enDate = dateHolder.formatted(.iso8601.month())
    return "\(currentDay)-\(enDate)"
}







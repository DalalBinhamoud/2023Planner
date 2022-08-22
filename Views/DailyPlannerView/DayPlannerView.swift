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

   // @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<DayPlanner>

    @EnvironmentObject var dateHolder: DateHolder

   // @State var selectedDayData: DailyPlanDto



    //    let formatter = DateFormatter()
    //    formatter.dateFormat = "MM-dd"



    var body: some View {
        VStack{
            List {
                 ForEach(CoreDataManager.shared.getAllDays(), id: \.self) { day in
                     Section(day.wrappedDate) {
                         ForEach(day.tasksArray, id: \.self) { task in
                             Text(task.wrappedName)
                         }
                     }
                 }
            }

            Button("add"){
                print("days=\(CoreDataManager.shared.getAllDays())")
             //   let task = Task(context: moc)

                let task = Task(context: CoreDataManager.shared.viewContext)


                task.taskName = "22222222"
               // task.taskCompleted = false
                let dd =   DayPlanner(context: CoreDataManager.shared.viewContext)
                task.belong = dd


                task.belong?.date = getCoreDataKey(dateHolder: dateHolder.date, currentDay: currentDay)


                let task2 = Task(context: CoreDataManager.shared.viewContext)


                task2.taskName = "22222222"
               // task.taskCompleted = false

                task2.belong = dd
                task2.belong?.date = getCoreDataKey(dateHolder: dateHolder.date, currentDay: currentDay)




                 CoreDataManager.shared.save()
                self.presentationMode.wrappedValue.dismiss()
            }


        }.frame(maxWidth: .infinity).background(.brown)

}

// we will store month-day as a key in core data
func getCoreDataKey (dateHolder: Date, currentDay: String) -> String
{
    let enDate = dateHolder.formatted(.iso8601.month())
    return "\(currentDay)-\(enDate)"
}


}




//
//  CalendarCell.swift
//  CalendarSwiftUI
//
//  Created by Callum Hill on 15/4/22.
//

import SwiftUI

struct CalendarCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    let count : Int
    let startingSpaces : Int
    let daysInMonth : Int
    let daysInPrevMonth : Int
    @State private var toggleDayPlannerView: Bool = false



    
    var body: some View
    {
        

        Button(action:{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "LLL yyyy"
            print("date= \(dateFormatter.string(from: dateHolder.date))")
            toggleDayPlannerView.toggle()
        }){
            Text(monthStruct().day()).foregroundColor(textColor(type: monthStruct().monthType))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//            if(toggleDayPlannerView){
//                DayPlannerView()
//            }

        }.fullScreenCover(isPresented: self.$toggleDayPlannerView, content: {
            DayPlannerView(toggleDay: $toggleDayPlannerView, currentDay: monthStruct().day())
        })

      

    }
    func textColor(type: MonthType) -> Color
    {
        return .red
    }
    
    func monthStruct() -> MonthStruct
    {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if(count <= start)
        {
            let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        }
        else if (count - start > daysInMonth)
        {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }
        
        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
    }
}

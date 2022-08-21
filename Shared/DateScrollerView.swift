//
//  DateScrollerView.swift
//  CalendarSwiftUI
//
//  Created by Callum Hill on 15/4/22.
//

import SwiftUI

extension Date {

    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }

    func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }

    var isInThisYear:  Bool { isInSameYear(as: Date()) }
    var isInThisMonth: Bool { isInSameMonth(as: Date()) }
    var isInThisWeek:  Bool { isInSameWeek(as: Date()) }

    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday:     Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }

    var isInTheFuture: Bool { self > Date() }
    var isInThePast:   Bool { self < Date() }
}

struct DateScrollerView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    @State private var disabledLeftArrow: Bool = false
    @State private var disabledRightArrow: Bool = false
    
    var body: some View
    {
        HStack
        {
            Spacer()
            Button(action: previousMonth)
            {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }.disabled(disabledLeftArrow)
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextMonth)
            {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }.disabled(disabledRightArrow)
            Spacer()
        }
    }
    
    func previousMonth()
    {
        disabledRightArrow = false
        let selectedDate = CalendarHelper().minusMonth(dateHolder.date)


        if(selectedDate.isInThisYear){
            dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)

        }else{
            disabledLeftArrow = true
        }

    }
    
    func nextMonth()
    {
        disabledLeftArrow = false
        let selectedDate = CalendarHelper().plusMonth(dateHolder.date)
        if(selectedDate.isInThisYear){
            dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
        }else{
            disabledRightArrow = true
        }
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}

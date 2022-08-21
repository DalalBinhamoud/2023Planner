//
//  DailyPlanDto.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 20/08/2022.
//

import Foundation

struct DailyPlanDto{
    var id: String // id = passed date
//    var tasks: [Task]
    var events : [Event]
    // excercises
    // food calorie tracker


}

//struct Task {
//    var id: UUID
//    var name: String
//    var status: TaskStatus
//}

enum  TaskStatus{
    case todo
    case inProgress
    case done
}

struct Event {
    var id: UUID
    var name: String
}

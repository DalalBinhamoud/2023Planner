//
//  Task2+CoreDataProperties.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 21/08/2022.
//
//

import Foundation
import CoreData


extension Task2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task2> {
        return NSFetchRequest<Task2>(entityName: "Task2")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var belongDate: DayPlanner2?

    public var wrappedName: String {
        taskName ?? "Unknown task"
    }


}

extension Task2 : Identifiable {

}

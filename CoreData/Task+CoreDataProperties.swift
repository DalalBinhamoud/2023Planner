//
//  Task+CoreDataProperties.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 21/08/2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var taskCompleted: Bool
    @NSManaged public var belong: DayPlanner?

    public var wrappedName: String {
        taskName ?? "Unknown task"
    }

    public var wrappedTaskCompleted: Bool {
        taskCompleted ?? false
    }



}

extension Task : Identifiable {

}

//
//  DayPlanner+CoreDataProperties.swift
//  CalendarSwiftUI (iOS)
//
//  Created by Dalal Macbook on 21/08/2022.
//
//

import Foundation
import CoreData


extension DayPlanner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayPlanner> {
        return NSFetchRequest<DayPlanner>(entityName: "DayPlanner")
    }

    @NSManaged public var date: String?
    @NSManaged public var has: NSSet?


    public var wrappedDate: String {
        date ?? "Unknown date"
    }

    public var tasksArray: [Task] {
        let set = has as? Set<Task> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for has
extension DayPlanner {

    @objc(addHasObject:)
    @NSManaged public func addToHas(_ value: Task)

    @objc(removeHasObject:)
    @NSManaged public func removeFromHas(_ value: Task)

    @objc(addHas:)
    @NSManaged public func addToHas(_ values: NSSet)

    @objc(removeHas:)
    @NSManaged public func removeFromHas(_ values: NSSet)

}

extension DayPlanner : Identifiable {

}

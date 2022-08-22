
import Foundation
import CoreData

struct CoreDataManager {

    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init() {
        persistentContainer = NSPersistentContainer(name: "Planner")
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error{
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }

    //Save object to coredata
    func save(){
        do{
            try viewContext.save()
        }
        catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }


    func getAllDays() -> [DayPlanner]{

        let request: NSFetchRequest<DayPlanner> = DayPlanner.fetchRequest()

        do{
            return try viewContext.fetch(request)
        }
        catch{
            return []
        }
    }

}

/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import CoreData

final class SampleData:NSObject {

static var mensaje: String = "Hello World"
/**
     Persistent container: use NSPersistentContainer to create the Core Data stack
    */
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Ratings")
        
        /**
         fatalError() causes the application to generate a crash log and terminate.
         You should not use this function in a shipping application.
        */
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
			mensaje = "WHOOPS:"
            fatalError("Unresolved error \(error), \(error.userInfo)")
        })
        

		if(container.viewContext == nil)
		{
			mensaje = "IMPLOSION 1"
		}
		else
		{
	        mensaje = "SUCCESS!"
		}
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil // We don't need undo so set it to nil.
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        /**
         Merge the changes from other contexts automatically.
         You can also choose to merge the changes by observing NSManagedObjectContextDidSave
         notification and calling mergeChanges(fromContextDidSave notification: Notification)
        */
        container.viewContext.automaticallyMergesChangesFromParent = true

		if(container.viewContext == nil)
		{
			mensaje += "IMPLOSION 2"
		}
		else
		{
	        mensaje += "SUCCESS!"
		}
        return container
    }()

  
  static func generatePlayersData() -> [Player] {
	let taskContext = persistentContainer.viewContext
	var rv: [Player] = []

	if(taskContext != nil)
{
rv = [
      generatePlayer(context:taskContext, name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
      generatePlayer(context:taskContext, name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
      generatePlayer(context:taskContext, name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
    ]
/*
	do {
        try taskContext.save(); //that's counterintuitive
    } catch {
		fatalError("Error:Blew up trying to save in SampleData::generatePlayersData(): \(error)")
    }*/
	
}
	return rv
  }

	static func generatePlayer(context:NSManagedObjectContext,name:String?,game:String?,rating:Int) -> Player {
	
		guard let rv = NSEntityDescription.insertNewObject(forEntityName: "Player", into: context) as? Player else {
		                fatalError("Error: Failed to create a new Player object!")
		            }
		//rv.update(name:name,game:game,rating:rating)
		return rv
		
	}

	static func generatePlayer(name:String?,game:String?,rating:Int) -> Player {
	
		let taskContext = persistentContainer.viewContext
		guard let rv = generatePlayer(context:taskContext, name: name, game: game, rating: rating) as? Player else {
		                fatalError("Error: Failed to create a new Player object!")
		            }
		return rv
		
	}

}

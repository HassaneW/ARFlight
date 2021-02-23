//
//  DatabaseService.swift
//  ARFlight
//
//  Created by Wandianga hassane on 22/02/2021.
//

import Foundation
import CoreData

class DatabaseService {
    
    // MARK: - Singleton
    static let shared = DatabaseService()

    // MARK: - Context Core Data
    private let persistentContainer: NSPersistentContainer
    private let viewContext: NSManagedObjectContext
    
    init(persistentContainer: NSPersistentContainer = AppDelegate.persistentContainer) {
        self.persistentContainer = persistentContainer
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        self.viewContext = persistentContainer.viewContext
    }
    
    // MARK: - private function Core Data
    func save(flight: Flight) throws {
        let flightEntity = FlightEntity(context: viewContext)
        
//        flightEntity.companyCode = flight.companyCode
//
//        flightEntity.companyName = flight.companyName
//
//        flightEntity.departAircraftModel = flight.departAircraftModel
//
//        flightEntity.departAircraftNumber = flight.departAircraftNumber
//
//        flightEntity.departAirportName = flight.departAirportName
//
//        flightEntity.departCityName = flight.departCityName
//
//        flightEntity.departCountryName = flight.departCountryName
//
//        flightEntity.departLocationLatitude = flight.departLocationLatitude
//
//        flightEntity.departLocationLongitude = flight.departLocationLongitude
//
//        flightEntity.departPlacesGateNumber = flight.departPlacesGateNumber
//
//        flightEntity.departPlacesTerminal = flight.departPlacesTerminal
//
//        flightEntity.departTimesScheduled = flight.departTimesScheduled
//
//        flightEntity.departureDate = flight.departureDate
//
//        flightEntity.flightNumber = flight.flightNumber
//
//        flightEntity.flightStatus = flight.flightStatus
//
//        flightEntity.flightTypeLong = flight.flightTypeLong
//
//        flightEntity.flightTypeMedium = flight.flightTypeMedium
//
//        flightEntity.identifiantPlane = flight.identifiantPlane
        
        
//        recipeEntity.ingredients = try? JSONEncoder().encode(recipe.ingredients)
//        do {
//            try viewContext.save()
//            print("Recipe \(recipe.title) added to CoreData")
//        } catch let error {
//            throw error
//        }
    }
    
//    func loadFlight() throws -> [Flight] {
//        let fetchRequest: NSFetchRequest<FlightEntity> = FlightEntity.fetchRequest()
//        let flightEntities: [FlightEntity]
//        do {
//            flightEntities = try viewContext.fetch(fetchRequest)
//        } catch let error {
//            throw error
//        }
//        return flightEntities.map { Flight(from: $0) }
//    }
//
    func delete(flight: Flight) throws {
        let fetchRequest: NSFetchRequest<FlightEntity> = FlightEntity.fetchRequest()
//        let titlePredicate = NSPredicate(format: "title == %@", recipe.title)
//        let urlPredicate = NSPredicate(format: "url == %@", recipe.url)
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [titlePredicate, urlPredicate])

        let managedObject = try viewContext.fetch(fetchRequest)

        
         for entity in managedObject {
             viewContext.delete(entity)
         }
        
        
        managedObject.forEach { (entity) in
            viewContext.delete(entity)
        }
    
        managedObject.forEach { viewContext.delete($0)}
        
        do {
            try viewContext.save()
//            print("Recipe \(recipe.title) deleted")
        } catch let error {
            throw error
        }
    }
}

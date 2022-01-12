//
//  CoreData.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//

import UIKit
import CoreData

class CoreData{
    static let sharedInstance = CoreData()
    private init(){
        
    }
    
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    //private let fetchRequest = NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
    
    private let fetchRequest = NSFetchRequest<HeroesEntities>(entityName: "HeroesEntities")
    
    func saveDataOf(heroes: [CustomModelDetailHeroElement]){
        
        //update CoreData with the new Data - off the main thread
        self.container?.performBackgroundTask{ [weak self] (context) in
            self?.deleteObjectsFromCoreData(context: context)
            self?.saveDataToCoreData(heroes: heroes, context: context)
        }
    }
    
    
    //MARK: - Delete Core Data objects before saving new data
    private func deleteObjectsFromCoreData(context: NSManagedObjectContext){
        do{
            //fetch data
            let objects = try context.fetch(fetchRequest)
            
            //delete data
            _ = objects.map({context.delete($0)})
            
            //save data
            try context.save()
        }catch{
            print("Deleting Error: \(error)")
        }
        
    }
    
    //MARK: - Save new data from the server to Core Data
    private func saveDataToCoreData(heroes: [CustomModelDetailHeroElement], context: NSManagedObjectContext) {
        //perform - make sure that this code of block will be executed the proper queue
        //in this case this code shold be perform off the main queue
        context.perform {
            for hero in heroes {
                //Assign the data
                //let heroesEntity = HeroesEntity(context: context)
                let heroesEntity = HeroesEntities(context: context)
                heroesEntity.name = hero.name
//                guard let blabla = hero[0].img
                //heroesEntity.baseAgi = String(hero[0].baseAgi)
            }
            //Save Data
            do{
                try context.save()
            }catch{
                fatalError("failure to save context: \(error)")
            }
            
        }
    }
}

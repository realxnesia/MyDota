//
//  HeroesEntities.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//

import Foundation
import CoreData

public class HeroesEntities: NSManagedObject{
    @NSManaged var id: Int16
    @NSManaged var name: String
    @NSManaged var localizedName: String
    @NSManaged var attackType: String
    @NSManaged var roles: String
    @NSManaged var img: String
    @NSManaged var icon: String
    @NSManaged var baseHealth: Int32
    @NSManaged var baseMana: Int
    @NSManaged var baseArmor: Double
    @NSManaged var baseAttackMin: Int32
    @NSManaged var baseArrackMax: Int32
    @NSManaged var baseStr: Int32
    @NSManaged var baseAgi: Int32
    @NSManaged var baseInt: Int32
    @NSManaged var attackRate: Double
    @NSManaged var moveSpeed: Int32
    
}

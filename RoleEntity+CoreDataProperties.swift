//
//  RoleEntity+CoreDataProperties.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//
//

import Foundation
import CoreData


extension RoleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoleEntity> {
        return NSFetchRequest<RoleEntity>(entityName: "RoleEntity")
    }

    @NSManaged public var role: String?
    @NSManaged public var hero: HeroesEntity?

}

extension RoleEntity : Identifiable {

}

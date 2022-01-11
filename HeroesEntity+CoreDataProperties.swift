//
//  HeroesEntity+CoreDataProperties.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//
//

import Foundation
import CoreData


extension HeroesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeroesEntity> {
        return NSFetchRequest<HeroesEntity>(entityName: "HeroesEntity")
    }

    @NSManaged public var attackRate: Double
    @NSManaged public var attackType: String?
    @NSManaged public var baseAgi: Int32
    @NSManaged public var baseArmor: Double
    @NSManaged public var baseAttackMax: Int32
    @NSManaged public var baseAttackMin: Int32
    @NSManaged public var baseHealth: Int32
    @NSManaged public var baseInt: Int32
    @NSManaged public var baseMana: Int32
    @NSManaged public var baseStr: Int32
    @NSManaged public var icon: String?
    @NSManaged public var id: Int16
    @NSManaged public var img: String?
    @NSManaged public var localizedName: String?
    @NSManaged public var moveSpeed: Int32
    @NSManaged public var name: String?
    @NSManaged public var primaryAttr: String?
    @NSManaged public var roles: String?
    @NSManaged public var role: NSSet?

}

// MARK: Generated accessors for role
extension HeroesEntity {

    @objc(addRoleObject:)
    @NSManaged public func addToRole(_ value: RoleEntity)

    @objc(removeRoleObject:)
    @NSManaged public func removeFromRole(_ value: RoleEntity)

    @objc(addRole:)
    @NSManaged public func addToRole(_ values: NSSet)

    @objc(removeRole:)
    @NSManaged public func removeFromRole(_ values: NSSet)

}

extension HeroesEntity : Identifiable {

}

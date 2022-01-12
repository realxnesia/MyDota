//
//  CustomModel.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 11/01/22.
//

import Foundation

///the model used to store data into the core data

typealias ModelDetailHeroes2 = [CustomModelDetailHeroElement]

struct CustomModelDetailHeroElement: Codable {
    let id: Int
    let name, localizedName: String
    let primaryAttr: PrimaryAttrs
    let attackType: AttackTypes
    let roles: [Rolee]
    let img, icon: String
    let baseHealth: Int
    let baseMana: Int
    let baseArmor: Double
    let baseAttackMin, baseAttackMax, baseStr: Int
    let baseAgi, baseInt: Int
    let attackRate: Double
    let moveSpeed: Int


    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
        case baseHealth = "base_health"
        case baseMana = "base_mana"
        case baseArmor = "base_armor"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
    }
}

enum AttackTypes: String, Codable {
    case melee = "Melee"
    case ranged = "Ranged"
}

enum PrimaryAttrs: String, Codable {
    case agi = "agi"
    case int = "int"
    case str = "str"
}

enum Rolee: String, Codable {
    case carry = "Carry"
    case disabler = "Disabler"
    case durable = "Durable"
    case escape = "Escape"
    case initiator = "Initiator"
    case jungler = "Jungler"
    case nuker = "Nuker"
    case pusher = "Pusher"
    case support = "Support"
}


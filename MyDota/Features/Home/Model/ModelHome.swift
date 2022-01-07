//
//  ModelHome.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import Foundation


struct GeneralData: Codable{
    ///Data Hero for Home view
    let name: String
    let role: String
    let image: String
    
    ///Data Hero for Hero Detail view
    let attack: String
    let defend: String
    let speed: String
    let hp: String
    let regen: String
    let type: String
}


struct Gg: Codable{
    let namaHero: String
    let posisi: [Posisi]
}

enum Posisi: String, Codable {
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



//
//  ModelHome.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import Foundation

///Model data for dummy data (hard code)

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


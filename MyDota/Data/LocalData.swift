//
//  LocalData.swift
//  MyDota
//
//  Created by DHIKA ADITYA ARE on 07/01/22.
//

import Foundation

struct localData{
    public static func intializeData() -> [GeneralData]{
        let generalDataHero: [GeneralData] = [

            GeneralData(name: "Witch Doctor", role: "Support", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
            GeneralData(name: "Crystal Maiden", role: "Support", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
            GeneralData(name: "Drow Ranger", role: "Pusher", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
            GeneralData(name: "Pudge", role: "Initiator", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
            GeneralData(name: "Sand King", role: "Disabler", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
            GeneralData(name: "Juggernaut", role: "Carry", image: "123", attack: "23 - 24", defend: "1.0", speed: "280", hp: "80", regen: "70", type: "agi"),
        ]
        return generalDataHero
    }
}

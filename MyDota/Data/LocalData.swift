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
            GeneralData(name: "Drow Ranger", role: "Pusher", image: "123"),
            GeneralData(name: "Pudge", role: "Initiator", image: "1234"),
            GeneralData(name: "Sand King", role: "Pusher", image: "123"),
            GeneralData(name: "Crystal Maiden", role: "Support", image: "123"),
            GeneralData(name: "Shadow Shaman", role: "Disabler", image: "123"),
            GeneralData(name: "Juggernaut", role: "Pusher", image: "123"),
            GeneralData(name: "Crystal Maiden", role: "Nuker", image: "123")
        ]
        return generalDataHero
    }
}

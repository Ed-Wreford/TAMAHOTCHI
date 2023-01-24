//
//  SomethingStats.swift
//  Tamagotchi
//
//  Created by Wreford, Edward (PGW) on 24/01/2023.
//

import Foundation

struct Stats {
    
    let name: String
    var age: Int
    var weight: Int
    var hunger: Int
    var healthMeter: Int
    var happiness: String
    
    func displayStats() -> String {
        
        return"""
            Name: \(name)
            Age: \(age)
            Weight: \(weight)
            Hunger: \(hunger)
            Health Meter: \(healthMeter)
            Happiness: \(happiness)
            """
                
            

    }
    
}

//
//  ModelDetails.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import Foundation
import UIKit

enum MenuModel: Int, CaseIterable {
    case aircraft, helicopter, tank, APC, field_artillery, MRL, military_auto, fuel_tank, drone, naval_ship, anti_aircraft, vehiclesAndFuelTanks, cruiseMissiles
    
    var description: String {
        switch self {
        case .aircraft:
            return "Aircraft"
        case .helicopter:
            return "Helicopter"
        case .tank:
            return "Tank"
        case .APC:
            return "APC"
        case .field_artillery:
            return "Artillery"
        case .MRL:
            return "MRL"
        case .military_auto:
            return "Military auto"
        case .fuel_tank:
            return "Fuel tank"
        case .drone:
            return "Drone"
        case .naval_ship:
            return "Naval ship"
        case .anti_aircraft:
            return "Anti aircraft"
        case .vehiclesAndFuelTanks:
            return "Vehicles And FuelTanks"
        case .cruiseMissiles:
            return "Cruise Missiles"
        }
    }
    
    var image: UIImage {
        switch self {
        case .aircraft:
            return UIImage(named: "aircraft")!
        case .helicopter:
            return UIImage(named: "helicopter")!
        case .tank:
            return UIImage(named: "tank")!
        case .APC:
            return UIImage(named: "arc")!
        case .field_artillery:
            return UIImage(named: "artillery")!
        case .MRL:
            return UIImage(named: "MRL")!
        case .military_auto:
            return UIImage(named: "military_auto")!
        case .fuel_tank:
            return UIImage(named: "fuel_tank")!
        case .drone:
            return UIImage(named: "drone")!
        case .naval_ship:
            return UIImage(named: "naval_ship")!
        case .anti_aircraft:
            return UIImage(named: "anti-aircraft")!
        case .vehiclesAndFuelTanks:
            return UIImage(named: "military_auto")!
        case .cruiseMissiles:
            return UIImage(named: "cruiseMissiles")!
            
        }
    }
}



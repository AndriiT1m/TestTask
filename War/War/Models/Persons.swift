//
//  Personnel.swift
//  War
//
//  Created by Andrii Tymoshchuk on 20.07.2022.
//

import Foundation

struct Persons: Codable {
    let date: String
    let day, personnel: Int
    let anotherPersonnel: Personnel
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case anotherPersonnel = "personnel*"
        case pow = "POW"
    }
}

enum Personnel: String, Codable {
    case about = "about"
    case more = "more"
}

typealias Welcome = [Persons]



//
//  Characters.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation


// MARK: - Characters
struct Characters: Codable, Hashable {
    let info: Info
    let results: [Results]
}

// MARK: - Info
struct Info: Codable, Hashable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Results: Codable, Hashable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let location: Location?
    let image: String?
}

// MARK: - Location
struct Location: Codable, Hashable {
    let name: String?
}

// MARK: - Sections
enum Sections {
    case main
}

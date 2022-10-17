//
//  RMModel.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

// MARK: - CharacterResponseModel
class CharacterResponseModel: Codable {
    let info: CharacterResponseInfoModel?
    let results: [CharacterResponseResultModel]?

    init(info: CharacterResponseInfoModel?, results: [CharacterResponseResultModel]?) {
        self.info = info
        self.results = results
    }
}

// MARK: - CharacterResponseInfoModel
class CharacterResponseInfoModel: Codable {
    let count, pages: Int?
    let next: String?

    init(count: Int?, pages: Int?, next: String?) {
        self.count = count
        self.pages = pages
        self.next = next
    }
}

// MARK: - CharacterResponseInfoResultModel
class CharacterResponseResultModel: Codable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?

    init(id: Int?, name: String?, status: Status?, species: Species?, type: String?, gender: Gender?, origin: Location?, location: Location?, image: String?, episode: [String]?, url: String?, created: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
class Location: Codable {
    let name: String?
    let url: String?

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

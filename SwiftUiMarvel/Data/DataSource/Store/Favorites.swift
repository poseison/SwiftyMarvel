//
//  Favorites.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 20/7/23.
//

import SwiftUI

class Favorites : ObservableObject {
    // the actual resorts the user has favorited
    private var characters: Set<Int>
    
    let defaults = UserDefaults.standard
    
    private let saveKey = "Favorites"
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let taskData = try? decoder.decode(Set<Int>.self, from: data)
            self.characters = taskData ?? []
        } else {
            self.characters = []
        }
    }

    func contains(_ character: Int) -> Bool {
        characters.contains(character)
    }

    func add(_ character: Int) {
        objectWillChange.send()
        characters.insert(character)
        save()
    }

    func remove(_ character: Int) {
        objectWillChange.send()
        characters.remove(character)
        save()
    }

    func save() {
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(characters) {
               defaults.set(encoded, forKey: "Favorites")
           }
       }
}


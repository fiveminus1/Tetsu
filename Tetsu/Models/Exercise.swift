//
//  Exercise.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/17/25.
//

import Foundation

struct Exercise: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String){
        self.id = id
        self.name = name
    }
    
}

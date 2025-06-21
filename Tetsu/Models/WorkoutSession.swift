//
//  WorkoutSession.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/18/25.
//

import Foundation

struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    let date: Date
    let exercises: [AddedExercise]
    let duration: Int?
    
    init(id: UUID = UUID(), date: Date, exercises: [AddedExercise] = [], duration: Int? = nil){
        self.id = id
        self.date = date
        self.exercises = exercises
        self.duration = duration
    }
}

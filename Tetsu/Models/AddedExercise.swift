//
//  Exercise.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import Foundation

struct AddedExercise: Identifiable, Codable{
    let id: UUID
    let exercise: Exercise
    let weight: Float
    let sets: Int
    let reps: Int
    
    init(id: UUID = UUID(), exercise: Exercise, weight: Float = 0.0, sets: Int = 0, reps: Int = 0){
        self.id = id
        self.exercise = exercise
        self.weight = weight
        self.sets = sets
        self.reps = reps
    }
}


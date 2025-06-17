//
//  Exercise.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import Foundation

struct AddedExercise: Identifiable{
    let id = UUID()
    let exercise: Exercise
    var sets: Int
    var reps: Int
}

extension AddedExercise  {
    init(exercise: Exercise){
        self.exercise = exercise
        self.sets = 0
        self.reps = 0
    }
}

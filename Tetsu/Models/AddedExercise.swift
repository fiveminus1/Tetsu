//
//  Exercise.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import Foundation

struct AddedExercise: Identifiable {
    let id = UUID()
    let name: String
    let sets: Int
    let reps: Int
}

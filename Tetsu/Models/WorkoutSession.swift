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
}

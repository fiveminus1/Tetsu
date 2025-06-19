//
//  LocalWorkoutStore.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/18/25.
//

import Foundation

class LocalWorkoutStore {
    static let shared = LocalWorkoutStore()
    private let fileURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("workouts.json")
    
    func loadWorkouts() -> [WorkoutSession] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        return (try? JSONDecoder().decode([WorkoutSession].self, from: data)) ?? []
    }
    
    func saveWorkout(_ session: WorkoutSession){
        var all = loadWorkouts()
        all.append(session)
        if let data = try? JSONEncoder().encode(all) {
            try? data.write(to: fileURL)
        }
    }
}

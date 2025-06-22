//
//  AddExerciseMenuView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/17/25.
//

import SwiftUI

struct AddExerciseMenuView: View {
    let exercises: [Exercise]
    var onAdd: (Exercise) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(exercises) { exercise in
                    Button{
                        onAdd(exercise)
                        dismiss()
                    } label: {
                        Text(exercise.name)
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Add Exercise")
        }
    }
}

#Preview {
    let sampleExercises = [
        Exercise(name: "Squat"),
        Exercise(name: "Deadlift"),
        Exercise(name: "Overhead Press")
    ]
    return AddExerciseMenuView(exercises: sampleExercises, onAdd: { _ in })
}

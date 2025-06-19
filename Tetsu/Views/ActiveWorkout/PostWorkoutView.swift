//
//  PostWorkoutView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/18/25.
//

import SwiftUI

struct PostWorkoutView: View {
    let workout: WorkoutSession
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("Workout Summary")
                    .font(.largeTitle)
                    .bold()
                
                Text("Date: \(workout.date.formatted(date: .abbreviated, time: .shortened))")
                    .font(.headline)
                Text("Duration: \(formattedTime(workout.duration ?? 0))")
                    .font(.subheadline)
                
                List(workout.exercises) { addedExercise in
                    VStack(alignment: .leading){
                        Text(addedExercise.exercise.name)
                            .font(.headline)
                        Text("Sets: \(addedExercise.sets), Reps: \(addedExercise.reps)")
                            .font(.subheadline)
                    }
                }
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    func formattedTime(_ seconds: Int) -> String{
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

//#Preview {
//    PostWorkoutView()
//}

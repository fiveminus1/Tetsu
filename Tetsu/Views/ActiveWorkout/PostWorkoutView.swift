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
                .frame(maxHeight: 250)
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Return")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
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

//
//  HistoryView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var dataManager: WorkoutDataManager
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 16){
                    if dataManager.workouts.isEmpty{
                        Text("No workouts yet.")
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    else{
                        ForEach(dataManager.workouts.sorted(by: { $0.date > $1.date })) { workout in
                                WorkoutCardView(workout: workout)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("History")
        }
    }
}

struct WorkoutCardView: View{
    let workout: WorkoutSession
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text(workout.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.headline)
                Spacer()
                Text(formattedTime(workout.duration ?? 0))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            ForEach(workout.exercises){ exercise in
                Text("\(exercise.exercise.name) - \(exercise.sets)x\(exercise.reps)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
    
    func formattedTime(_ seconds: Int) -> String{
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

#Preview {
    let manager = WorkoutDataManager()
    manager.saveWorkout(WorkoutSession(
        id: UUID(),
        date: Date(),
        exercises: [
            AddedExercise(exercise: Exercise(name: "Bench"), sets: 3, reps: 8),
            AddedExercise(exercise: Exercise(name: "Squat"), sets: 3, reps: 8),
        ],
        duration: 842
    ))
    return HistoryView().environmentObject(manager)
}

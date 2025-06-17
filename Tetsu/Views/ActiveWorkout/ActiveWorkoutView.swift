//
//  ActiveWorkoutView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import SwiftUI

struct ActiveWorkoutView: View {
    @State private var addedExercises: [AddedExercise] = [
        AddedExercise(exercise: Exercise(name: "Squats"), sets: 4, reps: 10)
    ]
    @State private var timer: Int = 0
    @State private var showingAddExerciseMenu = false
    
    let sampleExercises: [Exercise] = [ //TODO: replace with db
        Exercise(name: "Squat"),
        Exercise(name: "Bench"),
        Exercise(name: "Deadlift")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading, spacing: 4){
                Text("Active Workout")
                    .font(.largeTitle)
                    .bold()
                Text("\(formattedTime(timer))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            ScrollView{
                VStack(spacing: 12) {
                    if addedExercises.isEmpty {
                        Text("No exercises added yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(addedExercises) { addedExercise in
                            ExerciseCard(exercise: addedExercise)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    showingAddExerciseMenu = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExerciseMenu) {
            NavigationStack{
                AddExerciseMenuView(
                    exercises: sampleExercises,
                    onAdd: { newExercise in
                        let added = AddedExercise(exercise: newExercise)
                        addedExercises.append(added)
                    }
                )
            }
        }
        .onAppear {
            startTimer()
        }
    }
    func formattedTime(_ seconds: Int) -> String{
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timer += 1
        }
    }
    
    struct ExerciseCard: View{
        let exercise: AddedExercise
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.indigo.opacity(0.25))
                VStack(alignment: .leading){
                    Text(exercise.exercise.name)
                        .font(.headline)
                    Text("Sets: \(exercise.sets) Reps: \(exercise.reps)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 80)
            
            
        }
    }
    
    //#Preview {
    //    ActiveWorkoutView()
    //}
}

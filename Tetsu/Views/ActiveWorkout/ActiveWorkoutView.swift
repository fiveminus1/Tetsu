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
    @State private var showingSummary = false
    @State private var finishedWorkout: WorkoutSession? = nil
    
    @EnvironmentObject var dataManager: WorkoutDataManager
    
    let sampleExercises: [Exercise] = [ //TODO: replace with db
        Exercise(name: "Squat"),
        Exercise(name: "Bench"),
        Exercise(name: "Deadlift")
    ]
    
    var body: some View {
        NavigationStack {
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
                
                Button(action: finishWorkout){
                    Text("Finish Workout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding([.horizontal, .bottom])
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
        .navigationDestination(isPresented: $showingSummary){
            if let workout = finishedWorkout {
                PostWorkoutView(workout: workout)
            }
        }
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timer += 1
        }
    }
    
    func finishWorkout(){
        let session = WorkoutSession(
            id: UUID(),
            date: Date(),
            exercises: addedExercises,
            duration: timer
        )
        dataManager.saveWorkout(session)
        finishedWorkout = session
        showingSummary = true
        
        addedExercises = []
        timer = 0
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
}

#Preview {
    ActiveWorkoutView()
}

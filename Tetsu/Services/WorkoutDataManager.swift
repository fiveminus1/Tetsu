//
//  WorkoutDataManager.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/18/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class WorkoutDataManager: ObservableObject{
    private let localStore = LocalWorkoutStore()
    
    func saveWorkout(_ session: WorkoutSession){
        localStore.saveWorkout(session)
        
        if let user = Auth.auth().currentUser{
            saveToFirestore(session, userId: user.uid)
        }
    }
    
    func loadWorkouts() -> [WorkoutSession]{
        return localStore.loadWorkouts()
    }
    
    private func saveToFirestore(_ session: WorkoutSession, userId: String){
        let db = Firestore.firestore()
        do {
            try db.collection("users")
                .document(userId)
                .collection("workouts")
                .document(session.id.uuidString)
                .setData(from: session)
        } catch {
            print("Failed to save workout to Firestore: \(error)")
        }
    }
}

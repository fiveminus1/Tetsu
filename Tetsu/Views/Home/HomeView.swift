//
//  HomeView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text(greetingMessage())
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    VStack(spacing: 16){
                        StatCard(title: "Last Workout", subtitle: "Pull - 52 mins")
                        StatCard(title: "Weekly Progress", subtitle: "3 of 5 workouts done")
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: ActiveWorkoutView()){
                        Text("Start Workout")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Home")
        }
    }
    
    private func greetingMessage() -> String{
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:
            return "Good morning ☀️"
        case 12..<17:
            return "Good afternoon 👋"
        case 17..<22:
            return "Good evening 🌆"
        default:
            return "Welcome back 🌙"
        }
    }
}

struct StatCard: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
                .shadow(radius: 1)
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 100)
    }
}

#Preview {
    HomeView()
}

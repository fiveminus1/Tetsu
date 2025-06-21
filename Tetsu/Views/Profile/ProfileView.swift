//
//  ProfileView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/21/25.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 24){
            Text("Your Profile")
                .font(.largeTitle)
                .bold()
            
            if let user = authManager.user {
                VStack(spacing:12){
                    Text("You're signed in as:")
                    Text(user.email ?? user.uid)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Button("Log Out"){
                        authManager.signOut()
                    }
                    .foregroundColor(.red)
                }
            }
            else{
                VStack(spacing: 12){
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button("Log In"){
                        authManager.signInWithEmail(email: email, password: password)
                    }
                    
                    Button("Sign Up"){
                        authManager.signUp(email: email, password: password)
                    }
                }
            }
        }
        .padding()
        .onChange(of: authManager.user) {
            print("User changed")
        }

    }
}

#Preview {
    ProfileView()
}

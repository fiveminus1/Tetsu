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
        GeometryReader { geometry in
            VStack{
                Spacer()
                
                VStack(spacing: 24){
                    if let user = authManager.user {
                        VStack(spacing: 12){
                            Text("You're signed in as:")
                            Text(user.email ?? user.uid)
                                .font(.headline)
                                .foregroundColor(.indigo)
                            
                            Button("Log Out"){
                                authManager.signOut()
                            }
                            .foregroundColor(.red)
                        }
                    }
                    else{
                        VStack(spacing: 16){
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
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            
                            Button("Register"){
                                authManager.signUp(email: email, password: password)
                            }
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .frame(maxWidth: 400)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .onChange(of: authManager.user) {
            print("User changed")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthManager())
}

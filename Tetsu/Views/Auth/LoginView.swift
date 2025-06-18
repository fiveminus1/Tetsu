//
//  LoginView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/17/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20){
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
        .padding()
    }
}

#Preview {
    LoginView()
}

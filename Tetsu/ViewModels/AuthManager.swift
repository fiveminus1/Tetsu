//
//  AuthManager.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/17/25.
//

import Foundation
import FirebaseAuth

class AuthManager: ObservableObject{
    @Published var user: User? = Auth.auth().currentUser
    private var handle: AuthStateDidChangeListenerHandle?
    
    init(){
        handle = Auth.auth().addStateDidChangeListener{ _, user in
            DispatchQueue.main.async {
                self.user = user
            }
            
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
    }
    
    func signInWithEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
            }
        }
    }
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ _, error in
            if let error = error {
                print("Sign up error: \(error.localizedDescription)")
            }
        }
    }
}

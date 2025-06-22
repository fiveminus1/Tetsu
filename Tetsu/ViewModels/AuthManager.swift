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
    @Published var authError: String? = nil
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
        authError = nil
    }
    
    func signInWithEmail(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.authError = self.shownErrorMessage(from: error)
                } else{
                    self.authError = nil
                }
            }
        }
    }
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.authError = self.shownErrorMessage(from: error)
                } else{
                    self.authError = nil
                }
            }
        }
    }
    
    private func shownErrorMessage(from error: Error) -> String{
        let nsError = error as NSError
        switch(nsError.code){
        case AuthErrorCode.invalidEmail.rawValue:
            return "Please enter a valid email address."
        default:
            return "Something went wrong signing in. Please try again."
        }
    }
}

//
//  AuthGateView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/17/25.
//

import SwiftUI

struct AuthGateView: View {
    @StateObject private  var authManager = AuthManager()
    
    var body: some View {
        if let _ = authManager.user{
            ContentView().environmentObject(authManager)
        } else {
            LoginView()
                .environmentObject(authManager)
        }
    }
}

#Preview {
    AuthGateView()
}

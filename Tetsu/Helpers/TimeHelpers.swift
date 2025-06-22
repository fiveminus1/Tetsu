//
//  TimeHelpers.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/21/25.
//

import Foundation

func formattedTime(_ seconds: Int) -> String{
    let mins = seconds / 60
    let secs = seconds % 60
    return String(format: "%02d:%02d", mins, secs)
}

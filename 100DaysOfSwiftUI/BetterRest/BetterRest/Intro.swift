//
//  Intro.swift
//  BetterRest
//
//  Created by Xiang Liu on 1/23/21.
//

import SwiftUI

struct IntroView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()

    var body: some View {
//        var components = DateComponents()
//        components.hour = 8
//        components.month = 0
//        let date = Calendar.current.date(from: components) ?? Date()
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        
        // Stepper
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            // "%g" to elimate extra zero at end
            Text("\(sleepAmount, specifier: "%g") hours")
        }
        
        // DatePicker
        Form {
            DatePicker("Please enter", selection: $wakeUp, displayedComponents: .hourAndMinute)
        }
        // or
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...).labelsHidden()
    
    }
}

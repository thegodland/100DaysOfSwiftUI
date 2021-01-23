//
//  Challenge.swift
//  BetterRest
//
//  Created by Xiang Liu on 1/23/21.
//

import SwiftUI

struct Challenge: View {
    @State private var wakeup = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmountIndex = 0

    @State private var recommendation = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Your recommendation sleep time is \(recommendation)")
                        .font(.largeTitle)
                }
                
                Section(header: Text("when do you want to wake up?")
                            .font(.headline), content: {
                                
                                let wakeupBinding = Binding(
                                    get: { self.wakeup },
                                    set: {
                                        self.wakeup = $0
                                        self.calculateBedtime()
                                    }
                                )
                                
                                DatePicker("Please enter a time", selection: wakeupBinding, displayedComponents: .hourAndMinute).labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                            })
                
                Section(header: Text("Desired amount of sleep").font(.headline), content: {
                    let sleepAmountBinding = Binding(
                        get: { self.sleepAmount },
                        set: {
                            self.sleepAmount = $0
                            self.calculateBedtime()
                        }
                    )
                    
                    Stepper(value: sleepAmountBinding, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                })
                
                Section(header: Text("Daily coffee intake").font(.headline), content: {
                    
                    let cupBinding = Binding(
                        get: { self.coffeAmountIndex },
                        set: {
                            self.coffeAmountIndex = $0
                            self.calculateBedtime()
                        }
                    )

                    Picker("Number of cups", selection: cupBinding) {
                        ForEach(0..<20) {
                            if $0 == 0 {
                                Text("1 cup")
                            } else {
                                Text("\($0+1) cups")
                            }
                        }
                    }
                })
            }
            .navigationTitle("BetterRest")

        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    let model = SleepCalculator()
    
    func calculateBedtime() {
        // class
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeup)
        let hour = (components.hour ?? 0) * 3600
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmountIndex) + 1)
            let sleepTime = wakeup - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            recommendation = formatter.string(from: sleepTime)

        } catch {
            recommendation = "something went wrong"
        }
    }
}

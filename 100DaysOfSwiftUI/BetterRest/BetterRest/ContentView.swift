//
//  ContentView.swift
//  BetterRest
//
//  Created by Xiang Liu on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeup = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmountIndex = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("when do you want to wake up?")
                            .font(.headline), content: {
                                DatePicker("Please enter a time", selection: $wakeup, displayedComponents: .hourAndMinute).labelsHidden()
                                    .datePickerStyle(WheelDatePickerStyle())
                            })
                
                Section(header: Text("Desired amount of sleep").font(.headline), content: {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                })
                
                Section(header: Text("Daily coffee intake").font(.headline), content: {

                    Picker("Number of cups", selection: $coffeAmountIndex) {
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
            .navigationBarItems(trailing:
                                    Button(action: calculateBedtime) {
                                        Text("Calculate")
                                    }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() {
        // class
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeup)
        let hour = (components.hour ?? 0) * 3600
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmountIndex) + 1)
            
            let sleepTime = wakeup - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is..."
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, something went wrong"
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

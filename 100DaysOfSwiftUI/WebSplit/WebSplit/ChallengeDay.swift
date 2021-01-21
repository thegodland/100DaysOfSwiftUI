//
//  ChallengeDay.swift
//  WebSplit
//
//  Created by Xiang Liu on 1/19/21.
//

import SwiftUI

struct ChallengeDay: View {
    
    enum TimeType: String, CaseIterable {
        case seconds
        case minutes
        case hours
        case days
        
        func getConversionValue(of time: Double, inUnit: TimeType) -> Double {
            guard self != inUnit else { return time }
            guard time > 0 else { return 0 }
            
            var output = time
            /// first covert to seconds
            switch self {
            case .days:
                output *= 24
                fallthrough
            case .hours:
                output *= 60
                fallthrough
            case .minutes:
                output *= 60
                fallthrough
            case .seconds:
                break
            }
            
            /// covert seconds to target unit
            switch inUnit {
            case .seconds:
                return output
            case .minutes:
                return output / 60
            case .hours:
                return output / 3600
            case .days:
                return output / 86400
            }
        }
    }
    
    @State private var inputStateIndex = 0
    @State private var outputStateIndex = 0
    @State private var userInputValue = ""
    
    private var outputValue: Double {
        let inputVal = Double(userInputValue) ?? 0
        return TimeType.allCases[inputStateIndex].getConversionValue(of: inputVal, inUnit: TimeType.allCases[outputStateIndex])
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("input", selection: $inputStateIndex) {
                        ForEach(0..<TimeType.allCases.count) {
                            Text(TimeType.allCases[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("output", selection: $outputStateIndex) {
                        ForEach(0..<TimeType.allCases.count) {
                            Text(TimeType.allCases[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    TextField("Input Value", text: $userInputValue)
                        .keyboardType(.decimalPad)
                    Text("The conversion is \(outputValue, specifier: "%.2f")")
                }
                
            }.navigationTitle("Challenge Day")
            
        }
    }
}

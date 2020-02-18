//
//  ContentView.swift
//  WeSplit
//
//  Created by Mark Chen on 2020/2/10.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //    @State private var pressCount = 0
    //    var body: some View {
    //        Button("press count \(pressCount)") {
    //            self.pressCount += 1
    //        }
    //    }
    
    //    let students = ["Mark", "Vivian", "Moon"]
    //    @State private var selectedStudent = "Mark"
    //
    //    var body: some View {
    //        Picker("Slect your name", selection: $selectedStudent) {
    //            ForEach(0 ..< students.count) {
    //                Text(self.students[$0])
    //            }
    //
    //        }
    //    }
    
    let tipPercentageOptions = [10, 15, 20, 25, 0]
    
    @State private var accountAmount = ""
    @State private var peopleIndex = 2
    @State private var tipPercentage = 0
    
    var totalPerPerson: Double {
        let tip = Double(tipPercentageOptions[tipPercentage])
        let nunmberOfPeople = Double(peopleIndex+2)
        let total = Double(accountAmount) ?? 0

        return total * ( 1 + tip ) / nunmberOfPeople
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $accountAmount)
                        .keyboardType(.emailAddress)
                    Picker("How many people?", selection: $peopleIndex) {
                        ForEach(2 ..< 10) {
                            Text("\($0) people")
                        }
                    }
                }
               
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentageOptions.count) {
                            Text("\(self.tipPercentageOptions[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section {
                     Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
        
        
        //        How it works?
        //        1. Two way binding -> TexrField and Text
        //        2. Update UI when the @State variable is changed.
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}

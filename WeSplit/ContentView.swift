// progress: https://www.hackingwithswift.com/books/ios-swiftui/calculating-the-total-per-person
//
//  ContentView.swift
//  WeSplit
//
//  Created by Colucci, David on 3/23/20.
//  Copyright © 2020 Colucci, David. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipSelection = 2
    let tipPercentages = [10, 15, 20, 25, 0]

    var tipPercentage: Double {
        return Double(tipPercentages[tipSelection])
    }

    var totalWithTip: Double {
        let checkAmountDouble = Double(checkAmount) ?? 0
        let tipAbsoluteAmount = checkAmountDouble * tipPercentage / 100
        return checkAmountDouble + tipAbsoluteAmount
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalWithTip / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }

                Section(header: Text("Select tip amount")) {
                    Picker("Tip Percentage", selection: $tipSelection) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("Total with tip: $\(totalWithTip, specifier: "%.2f")")
                    Text("Amount per person: $\(totalPerPerson, specifier: "%.2f")")
                }
                .foregroundColor(tipPercentage == 0 ? .red : .black)
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

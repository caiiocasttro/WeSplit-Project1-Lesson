//
//  TextFieldModifying.swift
//  WeSplit
//
//  Created by Caio Castro on 11/08/2022.
//

import SwiftUI

struct TextFieldModifying: View {
    @State private var checkAmount = 0.0 // Value of the check
    @State private var numberOfPeople = 2 // Number of people on the table
    @State private var tipPercentage = 20 // Tip of percentage we want to give as cache
    @FocusState private var amountIsFocused: Bool // Var to put or not focus in our amount (The focus decide if our keyboard will or not be constantly on our screen)
    
    let tipPercentages = [10, 15, 20, 25, 0] // Array the contains all the percentages
    
    var totalPerPerson: Double { // Our calculator that will give us the correct amount
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelected
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotalMax: Double {
        let checkAmountII = Double(checkAmount)
        let percentSelected = Double(tipPercentage)
        
        let valueII = checkAmountII / 100 * percentSelected
        let grandTotal = checkAmountII + valueII
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView { // Navigation View wich give us the other views
        Form { // Our layout
            Section {
                TextField("Amount", value: $checkAmount, // Place to insert the value of our check
                          format: .currency(code: Locale.current.currencyCode ?? "USD")) // The current format of the money (Dolar, Euro and etc.)
                    .keyboardType(.decimalPad) // Te type of our keyboard
                    .focused($amountIsFocused)
                Picker("Number of people", selection: $numberOfPeople) { // Picker to give us the option of how many people we want to split
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
            }
            Section { // Section of our percentages options
                Picker("Tip percentage", selection: $tipPercentage){
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent )
                    }
                }
                .pickerStyle(.segmented) // Format of how will the percentages be printed on the screen
            } header: {
                Text("How much tip do you want to leave?")
            }
            Section {
                Text(grandTotalMax, format: .currency(code: Locale.current.currencyCode ?? "USD")) // Space to give us the grand total without split
                    .foregroundColor(tipPercentage <= 0 ? Color.red : Color.blue) // Condition that makes the grand total and the total per person be red if tip percentage is equal 0
            } header: {
                Text("Grand total!")
            }
            Section {
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD")) // Space to give us the correct amount per person
                    .foregroundColor(tipPercentage <= 0 ? Color.red : Color.blue)
            } header: {
                Text("Total per person!")
            }
        }
        .navigationBarTitle("We Split")
        .toolbar { // The place where we have the buton to hide our keyboard
            ToolbarItemGroup(placement: .keyboard) {
                
                Spacer() // Space to put the buton to the right
                Button("Done") { // The buton to hide our keyboard
                    amountIsFocused = false 
                }
            }
        }
        }
    }
}

struct TextFieldModifying_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldModifying()
    }
}

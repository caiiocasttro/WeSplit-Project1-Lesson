//
//  TextField.swift
//  WeSplit
//
//  Created by Caio Castro on 11/08/2022.
//

import SwiftUI

struct TextFieldII: View {
    
    @State private var name = ""
    
    var body: some View {
        Form{
            TextField("Enter your name", text: $name)
            Text("Your name is: \(name)")
        }
    }
}

struct TextFieldII_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldII()
    }
}

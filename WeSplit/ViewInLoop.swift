//
//  ViewInLoop.swift
//  WeSplit
//
//  Created by Caio Castro on 11/08/2022.
//

import SwiftUI

struct ViewInLoop: View {
    let Model = ["iPhone2", "iPhone3g", "iPhone3gs", "iPhone4",
                 "iPhone4s", "iPhone5", "iPhone5c", "iPhone5s",
                 "iPhone6", "iPhone6Plus", "iPhone6s", "iPhone6sPlus",
                 "iPhone7", "iPhone7Plus", "iPhone8", "iPhone8Plus",
                 "iPhoneX", "iPhoneXS", "iPhoneXSMax", "iPhoneXR",
                 "iPhone11", "iPhone11Pro", "iPhone11ProMax", "iPhone12",
                 "iPhone12Mini", "iPhone12Pro", "iPhone12ProMax", "iPhone13",
                 "iPhone13Mini", "iPhone13Pro", "iPhone13ProMax" ]
    @State private var selectModel = "iPhone"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your model", selection: $selectModel) { // Picker show us the options to use
                    ForEach(Model, id: \.self) { // In ForEach we use id: as an idification and \.self to tell xcode that the idification of the array is it self 
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ViewInLoop_Previews: PreviewProvider {
    static var previews: some View {
        ViewInLoop()
    }
}
